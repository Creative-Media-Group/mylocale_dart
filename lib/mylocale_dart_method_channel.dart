import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'mylocale_dart_platform_interface.dart';

/// An implementation of [MylocaleDartPlatform] that uses method channels.
class MethodChannelMylocaleDart extends MylocaleDartPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('mylocale_dart');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
