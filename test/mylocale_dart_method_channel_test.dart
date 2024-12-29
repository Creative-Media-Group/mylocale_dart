import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mylocale_dart/mylocale_dart_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelMylocaleDart platform = MethodChannelMylocaleDart();
  const MethodChannel channel = MethodChannel('mylocale_dart');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
