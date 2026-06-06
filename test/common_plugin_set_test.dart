// import 'package:flutter_test/flutter_test.dart';
// import 'package:common_plugin_set/common_plugin_set.dart';
// import 'package:common_plugin_set/common_plugin_set_platform_interface.dart';
// import 'package:common_plugin_set/common_plugin_set_method_channel.dart';
// import 'package:plugin_platform_interface/plugin_platform_interface.dart';

// class MockCommonPluginSetPlatform
//     with MockPlatformInterfaceMixin
//     implements CommonPluginSetPlatform {
//   @override
//   Future<String?> getPlatformVersion() => Future.value('42');
// }

// void main() {
//   final CommonPluginSetPlatform initialPlatform = CommonPluginSetPlatform.instance;

//   test('$MethodChannelCommonPluginSet is the default instance', () {
//     expect(initialPlatform, isInstanceOf<MethodChannelCommonPluginSet>());
//   });

//   test('getPlatformVersion', () async {
//     CommonPluginSet commonPluginSetPlugin = CommonPluginSet();
//     MockCommonPluginSetPlatform fakePlatform = MockCommonPluginSetPlatform();
//     CommonPluginSetPlatform.instance = fakePlatform;

//     expect(await commonPluginSetPlugin.getPlatformVersion(), '42');
//   });
// }
