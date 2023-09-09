import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'device_platform_interface.dart';

/// An implementation of [DevicePlatform] that uses method channels.
class MethodChannelDevice extends DevicePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('device');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<int?> getBatteryLevel() async {
    final battery = await methodChannel.invokeMethod('getBatteryLevel');
    return battery;
  }
}
