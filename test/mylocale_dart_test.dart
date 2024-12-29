import 'package:flutter_test/flutter_test.dart';
import 'package:mylocale_dart/mylocale_dart.dart';
import 'package:mylocale_dart/mylocale_dart_platform_interface.dart';
import 'package:mylocale_dart/mylocale_dart_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockMylocaleDartPlatform
    with MockPlatformInterfaceMixin
    implements MylocaleDartPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final MylocaleDartPlatform initialPlatform = MylocaleDartPlatform.instance;

  test('$MethodChannelMylocaleDart is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelMylocaleDart>());
  });

  test('getPlatformVersion', () async {
    MylocaleDartTest mylocaleDartPlugin = MylocaleDartTest();
    MockMylocaleDartPlatform fakePlatform = MockMylocaleDartPlatform();
    MylocaleDartPlatform.instance = fakePlatform;

    expect(await mylocaleDartPlugin.getPlatformVersion(), '42');
  });
}
