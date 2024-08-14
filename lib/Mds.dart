import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mdsflutter/internal/MdsImpl.dart';

const String _MDS_PREFIX = "suunto://";

class Mds {
  /// Starts scanning for Movesense devices. When a new Movesense device is
  /// found, onNewDeviceFound is called with device name and address. Android
  /// devices will get the Bluetooth MAC address of the sensor, where iOS
  /// devices will get UUID as the address parameter. Scanning is terminated
  /// automatically after 60 seconds. Only devices with Movesense services are
  /// returned.
  static void startScan(void Function(String?, String?) onNewDeviceFound) {
    MdsImpl().startScan(onNewDeviceFound);
  }

  /// Stops the ongoing scan.
  static void stopScan() {
    MdsImpl().stopScan();
  }

  /// Try to connect to a Movesense device with the given address. Address is
  /// Bluetooth MAC address for Android devices and UUID for iOS devices. When
  /// connection is established, onConnected is called with the device serial.
  /// onDisconnected is called when device disconnects. onConnectionError is
  /// called when an error occurs during connection attempt.
  ///
  /// Note: If you need DeviceInfo upon connection, you should manually
  /// subscribe to "MDS/ConnectedDevices" to get detailed device information
  /// upon connection.
  static void connect(String address, void Function(String) onConnected,
      void Function() onDisconnected, void Function(String) onConnectionError) {
    MdsImpl().connect(address, onConnected, onDisconnected, onConnectionError);
  }

  /// Disconnect from the device with the given address.
  static void disconnect(String address) {
    MdsImpl().disconnect(address);
  }

  /// Make a GET request for a resource. uri must include "suunto://" prefix
  /// and device serial if needed. contract must be a json string. If the
  /// request is successful, onSuccess is called with response data in json
  /// string format, and status code. Upon error, onError is called with reason
  /// and status code.
  static void get(
      String uri,
      String contract,
      void Function(String, int) onSuccess,
      void Function(String, int) onError) {
    MdsImpl().get(uri, contract, onSuccess, onError);
  }

  /// Make a PUT request for a resource. uri must include "suunto://" prefix
  /// and device serial if needed. contract must be a json string. If the
  /// request is successful, onSuccess is called with response data in json
  /// string format, and status code. Upon error, onError is called with reason
  /// and status code.
  static void put(
      String uri,
      String contract,
      void Function(String, int) onSuccess,
      void Function(String, int) onError) {
    MdsImpl().put(uri, contract, onSuccess, onError);
  }

  /// Make a POST request for a resource. uri must include "suunto://" prefix
  /// and device serial if needed. contract must be a json string. If the
  /// request is successful, onSuccess is called with response data in json
  /// string format, and status code. Upon error, onError is called with reason
  /// and status code.
  static void post(
      String uri,
      String contract,
      void Function(String, int) onSuccess,
      void Function(String, int) onError) {
    MdsImpl().post(uri, contract, onSuccess, onError);
  }

  /// Make a DEL request for a resource. uri must include "suunto://" prefix
  /// and device serial if needed. contract must be a json string. If the
  /// request is successful, onSuccess is called with response data in json
  /// string format, and status code. Upon error, onError is called with reason
  /// and status code.
  static void del(
      String uri,
      String contract,
      void Function(String, int) onSuccess,
      void Function(String, int) onError) {
    MdsImpl().del(uri, contract, onSuccess, onError);
  }

  /// Make a SUBSCRIPTION request for a resource. uri must include "suunto://"
  /// prefix and device serial if needed. contract must be a json string. If the
  /// request is successful, onSuccess is called with response data in json
  /// string format, and status code. Upon error, onError is called with reason
  /// and status code. When there is a notification, onNotification is called
  /// with notification data, which is in json string format.
  /// onSubscriptionError is called when an error occurs with subscription, with
  /// reason and error status code.
  ///
  /// This call returns a subscription id. It must be held and used when
  /// unsubscribing.
  static int subscribe(
      String uri,
      String contract,
      void Function(String, int) onSuccess,
      void Function(String, int) onError,
      void Function(String) onNotification,
      void Function(String, int) onSubscriptionError) {
    return MdsImpl().subscribe(
        uri, contract, onSuccess, onError, onNotification, onSubscriptionError);
  }

  /// Unsubscribe from the subscription with the given subscriptionId.
  static void unsubscribe(int subscriptionId) {
    MdsImpl().unsubscribe(subscriptionId);
  }

  static String createRequestUri(String serial, String resource) {
    return _MDS_PREFIX + serial + resource;
  }

  static String createSubscriptionUri(String serial, String resource) {
    return serial + resource;
  }
}

class MdsError {
  int status;
  String error;
  MdsError(this.status, this.error);
}

class MdsAsync {
  /// Starts scanning for Movesense devices. When a new Movesense device is
  /// found, onNewDeviceFound is called with device name and address. Android
  /// devices will get the Bluetooth MAC address of the sensor, where iOS
  /// devices will get UUID as the address parameter. Scanning is terminated
  /// automatically after 60 seconds. Only devices with Movesense services are
  /// returned.
  static void startScan(void Function(String?, String?) onNewDeviceFound) {
    MdsImpl().startScan(onNewDeviceFound);
  }

  /// Stops the ongoing scan.
  static void stopScan() {
    MdsImpl().stopScan();
  }

  /// Make an async GET request for a resource. uri must include "suunto://" prefix
  /// and device serial if needed. contract must be a json string.
  /// Returns a Future that completes with the response data in json format.
  static Future<dynamic> get(String uri, String contract) {
    final mdscompleter = Completer<dynamic>();

    MdsImpl().get(uri, contract, (data, status) {
      debugPrint("MdsAsync.get result: $status, $data");
      var content = data.isEmpty ? {} : jsonDecode(data);
      // Handle case where content is not in "Content" key (MDS Logbook proxy service)
      content = content["Content"] ?? content;
      mdscompleter.complete(content);
    }, (data, status) {
      debugPrint("MdsAsync.get error: $status, $data");
      mdscompleter.completeError(MdsError(status, data));
    });
    return mdscompleter.future;
  }

  /// Make a PUT request for a resource. uri must include "suunto://" prefix
  /// and device serial if needed. contract must be a json string.
  /// Returns a Future that completes with the response data in json format.
  static Future<dynamic> put(String uri, String contract) {
    final mdscompleter = Completer<dynamic>();

    MdsImpl().put(uri, contract, (data, status) {
      debugPrint("MdsAsync.put result: $status, $data");
      final content = data.isEmpty ? {} : jsonDecode(data);
      debugPrint(" content: $content");
      mdscompleter.complete(content?["Content"]);
    }, (data, status) {
      debugPrint("MdsAsync.put error: $status, $data");
      mdscompleter.completeError(MdsError(status, data));
    });
    return mdscompleter.future;
  }

  /// Make a POST request for a resource. uri must include "suunto://" prefix
  /// and device serial if needed. contract must be a json string.
  /// Returns a Future that completes with the response data in json format.
  static Future<dynamic> post(String uri, String contract) {
    final mdscompleter = Completer<dynamic>();

    MdsImpl().post(uri, contract, (data, status) {
      final content = data.isEmpty ? {} : jsonDecode(data);
      debugPrint(" content: $content");
      mdscompleter.complete(content?["Content"]);
    }, (data, status) {
      mdscompleter.completeError(MdsError(status, data));
    });
    return mdscompleter.future;
  }

  /// Make a DEL request for a resource. uri must include "suunto://" prefix
  /// and device serial if needed. contract must be a json string.
  /// Returns a Future that completes with the response data in json format.
  static Future<dynamic> del(String uri, String contract) {
    final mdscompleter = Completer<dynamic>();

    MdsImpl().del(uri, contract, (data, status) {
      final content = data.isEmpty ? {} : jsonDecode(data);
      debugPrint(" content: $content");
      mdscompleter.complete(content?["Content"]);
    }, (data, status) {
      mdscompleter.completeError(MdsError(status, data));
    });
    return mdscompleter.future;
  }

  /// Make a SUBSCRIPTION request for a resource. uri must include "suunto://"
  /// prefix and device serial if needed. contract must be a json string.
  ///
  /// This call returns a Stream which will emit the notification data.
  /// Unsubscribing the Stream will automatically unsubscribe from the subscription.
  static Stream<dynamic> subscribe(String uri, String contract) {
    final controller = StreamController<dynamic>();

    final int subscriptionId =
        MdsImpl().subscribe(uri, contract, (errormsg, status) {
      // OnSuccess
    }, (errormsg, status) {
      // OnError
      debugPrint("onSubscriptionError: $status, msg: $errormsg");
      controller.addError(MdsError(status, errormsg));
    }, (data) {
      // onNotification
      final content = jsonDecode(data);
      controller.add(content);
    }, (errormsg, status) {
      // onSubscriptionError
      debugPrint("onSubscriptionError: $status, msg: $errormsg");
      controller.addError(MdsError(status, errormsg));
    });
    // Register onCancel handler now that we have subscriptionId
    controller.onCancel = () {
      MdsImpl().unsubscribe(subscriptionId);
      controller.close();
    };

    return controller.stream;
  }
}
