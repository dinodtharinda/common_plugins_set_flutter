
import 'common_plugin_set_platform_interface.dart';

class CommonPluginSet {
  Future<String?> getPlatformVersion() {
    return CommonPluginSetPlatform.instance.getPlatformVersion();
  }
}

