## 2.3.0

* Removing depricated PluginRegistry.Registrar

## 2.2.0

* Feature: onBleConnected callback

## 2.1.2
 
* Bugfix: namespace not defined by 84rrry (PR #27)
* Bugfix: Broken example
* migrated from deprecated gradle syntax
* ios version to 12

## 2.1.1
 
* Bugfix: Cocoapods can't access remote repository (Issue #13)
* Bugfix: The MdsAsync API is not documented (Issue #14)

## 2.1.0

* Prevent duplicate connections to same device
* Add error information to callback (Issue #20)
* Bugfix: MDS Not Cleared on app kill

## 2.0.0

* Fixed "MdsAsync.get returns null" (Issue #6)
* Changed protobuf-lite to -javalite (Issue #4)
* Tested with latest flutter and MDS (3.15.0)
* Updated to more modern gradle
* changed minimum ios version to 12
* Feature: Async API (See: MdsAsync)  Please send feedback and improvement ideas!

## 1.1.0

* Feature: Null safety

## 1.0.1

* Bugfix: Reconnect doesn't work if disconnect caused by BLE connection loss

## 1.0.0

* Initial release of the plugin.
