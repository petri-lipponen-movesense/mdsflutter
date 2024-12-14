enum DeviceConnectionStatus {
  NOT_CONNECTED,
  CONNECTING,
  BLE_CONNECTED,
  CONNECTED
}

extension DeviceConnectionStatusExtenstion on DeviceConnectionStatus {
  String get statusName {
    switch (this) {
      case DeviceConnectionStatus.NOT_CONNECTED:
        return "Not connected";
      case DeviceConnectionStatus.CONNECTING:
        return "Connecting";
      case DeviceConnectionStatus.BLE_CONNECTED:
        return "BLE connected";
      case DeviceConnectionStatus.CONNECTED:
        return "MDS connected";
    }
  }
}
