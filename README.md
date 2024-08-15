# mdsflutter

Flutter plugin for MDS (Movesense Device Service) that is used for communicating with Movesense devices.

## NEW: Async API

This is the development version for a new Async API. Please give any opinions, suggestions and other feedback to me (Petri.Lipponen (at) movesense.com).


### Additional steps for using the plugin

#### iOS

1. Intall Movesense iOS library using CocoaPods with adding this line to your app's Podfile:
  ```
  pod 'Movesense', :git => 'ssh://git@altssh.bitbucket.org:443/movesense/movesense-mobile-lib.git'
  ```

2. Set up your ios/Podfile as follows:
```
target 'Runner' do
  use_modular_headers!
  use_frameworks! :linkage => :static

  pod 'Movesense', :git => 'https://bitbucket.org/movesense/movesense-mobile-lib.git'

  flutter_install_all_ios_pods File.dirname(File.realpath(__FILE__))
end
```
so that MDS library is linked correctly. If you need to use frameworks that demand dynamic linking, [follow the instructions here](https://bitbucket.org/movesense/movesense-mobile-lib/issues/119/cannot-use-health-and-mdsflutter-depending).

#### Android

1. Download 'mdslib-x.x.x-release.aar' from movesense-mobile-lib repository and put it somewhere under 'android' folder of your app. Preferably create a new folder named 'android/libs' and put it there.

2. In 'build.gradle' of your android project, add the following lines (assuming .aar file is in android/libs):
```
allprojects {
    repositories {
        ...
        flatDir{
            dirs "$rootDir/libs"
        }
    }
}
```
## Usage

```dart
import 'package:mdsflutter/Mds.dart';

// Scan for new devices
Mds.startScan((name, address) {
    // Handle new scanned device
});

// Stop scanning
Mds.stopScan();

// Connect to a Movesense device
Mds.connect(address,
            (serial) { /* onConnected */ },
            () { /* onDisconnected */ },
            (error) { /* onConnectionError */ }
    );

// Disconnect from a device
Mds.disconnect(address);

// Make a GET, PUT, POST, DEL request
Mds.get(Mds.createRequestUri(serial, resourceUri),
      contract,
      (data, statusCode) { /* onSuccess */ },
      (error, statusCode) { /* onError */ }
    );

// Make a subscription request
int subscriptionId = Mds.subscribe(Mds.createSubscriptionUri(serial, resourceUri),
      contract,
      (data, statusCode) { /* onSuccess */ },
      (error, statusCode) { /* onError */ },
      (data) { /* onNotification */ },
      (error, statusCode) { /* onSubscriptionError */ }
    );

// Unsubscribe from a subscription
Mds.unsubscribe(subscriptionId);
```
For more information and detailed documentation, check Mds.dart file. Example
application further demonstrates the usage off the plugin.
