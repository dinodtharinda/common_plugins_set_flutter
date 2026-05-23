import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'common_plugin_set_platform_interface.dart';

/// An implementation of [CommonPluginSetPlatform] that uses method channels.
class MethodChannelCommonPluginSet extends CommonPluginSetPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('common_plugin_set');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>(
      'getPlatformVersion',
    );
    return version;
  }

  @override
  Future<double> sum(double a, double b)async {
    final sum = await methodChannel.invokeMethod<double>("sum", { "a":a, "b":b });

    return sum ?? 0;
  }
}
