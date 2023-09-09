import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'device_method_channel.dart';

abstract class DevicePlatform extends PlatformInterface {
  static final Object _token = Object();
  DevicePlatform() : super(token: _token);

  static DevicePlatform _instance = MethodChannelDevice();

  /// The default instance of [DevicePlatform] to use.
  ///
  /// Defaults to [MethodChannelDevice].
  static DevicePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [DevicePlatform] when
  /// they register themselves.
  static set instance(DevicePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<int?> getBatteryLevel() {
    throw UnimplementedError('getBatteryLevel() has not been implemented.');
  }
}
