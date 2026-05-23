import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'common_plugin_set_method_channel.dart';

abstract class CommonPluginSetPlatform extends PlatformInterface {
  /// Constructs a CommonPluginSetPlatform.
  CommonPluginSetPlatform() : super(token: _token);

  static final Object _token = Object();

  static CommonPluginSetPlatform _instance = MethodChannelCommonPluginSet();

  /// The default instance of [CommonPluginSetPlatform] to use.
  ///
  /// Defaults to [MethodChannelCommonPluginSet].
  static CommonPluginSetPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [CommonPluginSetPlatform] when
  /// they register themselves.
  static set instance(CommonPluginSetPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<double> sum(double a, double b){
    throw UnimplementedError("sum() has not been implemented");
  }
}
