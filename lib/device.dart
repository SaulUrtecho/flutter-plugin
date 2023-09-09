import 'device_platform_interface.dart';

class Device {
  Future<String?> getPlatformVersion() {
    return DevicePlatform.instance.getPlatformVersion();
  }

  Future<int?> getBatteryLevel() {
    return DevicePlatform.instance.getBatteryLevel();
  }
}
