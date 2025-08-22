import Flutter
import UIKit
import CoreBluetooth

public class SwiftMdsflutterPlugin: NSObject, FlutterPlugin, CBCentralManagerDelegate {
    private var centralManager: CBCentralManager!
    private let mds = MdsService()
    private var subscriptions: Dictionary<Int, String>  = [:]
    private static var channel: FlutterMethodChannel? = nil
    private var peripheralDict: Dictionary<String, CBPeripheral>  = [:]
    
    override init() {
        super.init()
        // Create central manager so that we can receive BLE connection events
        self.centralManager = CBCentralManager(delegate: self, queue: nil)
    }

    public static func register(with registrar: FlutterPluginRegistrar) {
        channel = FlutterMethodChannel(name: "mdsflutter", binaryMessenger: registrar.messenger())
        let instance = SwiftMdsflutterPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel!)
    }
    
    // Called when ble connection succeeded
    public func centralManager(_ central: CBCentralManager,
        didConnect peripheral: CBPeripheral)
    {
        SwiftMdsflutterPlugin.channel?.invokeMethod("onBleConnected", arguments: peripheral.identifier.uuidString)
    }

    // Called when the central manager's state is updated
    public func centralManagerDidUpdateState(_ central: CBCentralManager) {
        switch central.state {
        case .poweredOn:
            //print("SwiftMdsflutterPlugin: Bluetooth is powered on")
            break
        case .poweredOff:
            //print("BSwiftMdsflutterPlugin: luetooth is powered off")
            break
        case .resetting:
            //print("SwiftMdsflutterPlugin: Bluetooth is resetting")
            break
        case .unauthorized:
            //print("SwiftMdsflutterPlugin: Bluetooth is unauthorized")
            break
        case .unsupported:
            //print("SwiftMdsflutterPlugin: Bluetooth is unsupported")
            break
        case .unknown:
            //print("SwiftMdsflutterPlugin: Bluetooth state is unknown")
            break
        @unknown default:
            print("SwiftMdsflutterPlugin: A previously unknown central manager state occurred")
        }
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "startScan": do {
            guard let args = call.arguments else {
                self.mds.startScan({device in self.handleScannedDevice(device: device)}, {}, false)
                return
            }
            
            if let myArgs = args as? [String: Any],
               let includeDfu = myArgs["includeDfu"] as? Bool {
                self.mds.startScan({device in self.handleScannedDevice(device: device)}, {}, includeDfu)
            } else {
                self.mds.startScan({device in self.handleScannedDevice(device: device)}, {}, false)
            }
        }
        case "stopScan": do {
            self.mds.stopScan()
        }
        case "connect": do {
            guard let args = call.arguments else {
                result(FlutterError(code: "-1", message: "iOS could not extract " +
                "flutter arguments in method: (connect)", details: nil))
              return
            }
            if let myArgs = args as? [String: Any],
               let address = myArgs["address"] as? String {
                self.mds.connectDevice(address)
                // Connect this central manager to the peripheral
                // just so we get the BLE connection events
                let peripheralId = UUID(uuidString: address)
                let previouslyConnected = centralManager
                    .retrievePeripherals(withIdentifiers: [peripheralId!])
                    .first
                // Save the peripheral so we can receive events to it
                peripheralDict[address] = previouslyConnected
                if (previouslyConnected != nil) {
                    self.centralManager.connect(previouslyConnected!, options: nil)
                }
              result("Params received on iOS = \(address)")
            } else {
              result(FlutterError(code: "-1", message: "iOS could not extract " +
                 "flutter arguments in method: (connect)", details: nil))
            }
        }
        case "disconnect":
            guard let args = call.arguments else {
                result(FlutterError(code: "-1", message: "iOS could not extract " +
                "flutter arguments in method: (disconnect)", details: nil))
              return
            }
            if let myArgs = args as? [String: Any],
               let address = myArgs["address"] as? String {
              result("Params received on iOS = \(address)")
                self.mds.disconnectDevice(address)
                // Also call disconnect on local central manager
                if (peripheralDict[address] != nil) {
                    self.centralManager.cancelPeripheralConnection(peripheralDict[address]!)
                }
            } else {
              result(FlutterError(code: "-1", message: "iOS could not extract " +
                 "flutter arguments in method: (disconnect)", details: nil))
            }
        case "get": fallthrough
        case "put": fallthrough
        case "post": fallthrough
        case "del": self.handleRequest(call: call, result: result, callName: call.method)
        case "subscribe":
            guard let args = call.arguments else {
                result(FlutterError(code: "-1", message: "iOS could not extract " +
                "flutter arguments in method: (subscribe)", details: nil))
              return
            }
            if let myArgs = args as? [String: Any],
               let uri = myArgs["uri"] as? String,
               let contract = myArgs["contract"] as? String,
               let requestId = myArgs["requestId"] as? Int,
               let subscriptionId = myArgs["subscriptionId"] as? Int
            {
                result("Params received on iOS")
                let params = self.convertToDictionary(text: contract)
                if (params == nil) {
                    result(FlutterError(code:"-1", message: "invalid contract.", details: nil))
                    return
                }
                mds.subscribe(uri, params!, { data, code in
                    self.subscriptions[subscriptionId] = uri
                    self.handleResponse(data: data, code: code, requestId: requestId, result: result)
                }, { data in
                    var notification = Notification()
                    notification.data = data
                    notification.subscriptionID = Int32(subscriptionId)
                    guard let binaryData = try? notification.serializedData() else {
                        result(FlutterError(code:"-1", message: "Internal error.", details: nil))
                        return
                    }
                    SwiftMdsflutterPlugin.channel?.invokeMethod("onNotification", arguments: binaryData)
                }, { error, code in
                    var notifyError = NotificationError()
                    notifyError.error = error
                    notifyError.statusCode = Int32(code)
                    notifyError.subscriptionID = Int32(subscriptionId)
                    guard let binaryData = try? notifyError.serializedData() else {
                        result(FlutterError(code:"-1", message: "Internal error.", details: nil))
                        return
                    }
                    SwiftMdsflutterPlugin.channel?.invokeMethod("onNotificationError", arguments: binaryData)
                    self.subscriptions.removeValue(forKey: subscriptionId)
                })
            } else {
              result(FlutterError(code: "-1", message: "iOS could not extract " +
                 "flutter arguments in method: (subscribe)", details: nil))
            }
        case "unsubscribe":
            guard let args = call.arguments else {
                result(FlutterError(code: "-1", message: "iOS could not extract " +
                "flutter arguments in method: (unsubscribe)", details: nil))
              return
            }
            if let myArgs = args as? [String: Any],
               let subscriptionId = myArgs["subscriptionId"] as? Int {
               if let uri = self.subscriptions[subscriptionId] {
                    self.mds.unsubscribe(uri)
                    result("Params received on iOS")
                } else {
                    result("Subscription not present anymore")
                }
            } else {
              result(FlutterError(code: "-1", message: "iOS could not cast " +
                 "flutter arguments to correct type in method: (unsubscribe)", details: args))
            }
        default: break
        }
      }
    
    private func handleRequest(call: FlutterMethodCall, result: @escaping FlutterResult, callName: String) {
        guard let args = call.arguments else {
            result(FlutterError(code: "-1", message: "iOS could not extract " +
            "flutter arguments in method: (" + callName + ")", details: nil))
          return
        }
        if let myArgs = args as? [String: Any],
           let uri = myArgs["uri"] as? String,
           let contract = myArgs["contract"] as? String,
           let requestId = myArgs["requestId"] as? Int
        {
            result("Params received on iOS")
            let params = self.convertToDictionary(text: contract)
            if (params == nil) {
                result(FlutterError(code:"-1", message: "invalid contract.", details: nil))
                return
            }
            
            switch callName {
            case "get":
                self.mds.get(uri, params!, { data, code in
                self.handleResponse(data: data, code: code, requestId: requestId, result: result)
                }, { error, code in
                    self.handleResponseError(error: error, code: code, requestId: requestId, result: result)
                })
            case "put":
                self.mds.put(uri, params!, { data, code in
                self.handleResponse(data: data, code: code, requestId: requestId, result: result)
                }, { error, code in
                    self.handleResponseError(error: error, code: code, requestId: requestId, result: result)
                })
            case "post":
                self.mds.post(uri, params!, { data, code in
                self.handleResponse(data: data, code: code, requestId: requestId, result: result)
                }, { error, code in
                    self.handleResponseError(error: error, code: code, requestId: requestId, result: result)
                })
            case "del":
                self.mds.del(uri, params!, { data, code in
                self.handleResponse(data: data, code: code, requestId: requestId, result: result)
                }, { error, code in
                    self.handleResponseError(error: error, code: code, requestId: requestId, result: result)
                })
            default:
                result("Internal error")
            }
        } else {
          result(FlutterError(code: "-1", message: "iOS could not extract " +
             "flutter arguments in method: (" + callName + ")", details: nil))
        }
    }
    
    private func handleResponse(data: String, code: Int, requestId: Int, result: @escaping FlutterResult) {
        var reqResult = RequestResult()
        reqResult.data = data
        reqResult.statusCode = Int32(code)
        reqResult.requestID = Int32(requestId)
        guard let binaryData = try? reqResult.serializedData() else {
            result(FlutterError(code:"-1", message: "Internal error.", details: nil))
            return
        }
        SwiftMdsflutterPlugin.channel?.invokeMethod("onRequestResult", arguments: binaryData)
    }
    
    private func handleResponseError(error: String, code: Int, requestId: Int, result: @escaping FlutterResult) {
        var reqResult = RequestError()
        reqResult.requestID = Int32(requestId)
        reqResult.statusCode = Int32(code)
        reqResult.error = error
        guard let binaryData = try? reqResult.serializedData() else {
            result(FlutterError(code:"-1", message: "Internal error.", details: nil))
            return
        }
        SwiftMdsflutterPlugin.channel?.invokeMethod("onRequestError", arguments: binaryData)
    }
    
    private func handleScannedDevice(device: MovesenseDevice) {
        let deviceSend = ["name": device.localName, "address": device.uuid.uuidString] as [String : String]
        SwiftMdsflutterPlugin.channel?.invokeMethod("onNewScannedDevice", arguments: deviceSend)
    }
    
    func convertToDictionary(text: String) -> [String: Any]? {
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print("Could not parse contract json for request." + error.localizedDescription)
            }
        }
        return nil
    }
    
}
