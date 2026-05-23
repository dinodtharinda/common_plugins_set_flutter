import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:common_plugin_set/common_plugin_set_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelCommonPluginSet platform = MethodChannelCommonPluginSet();
  const MethodChannel channel = MethodChannel('common_plugin_set');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
          return '42';
        });
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
