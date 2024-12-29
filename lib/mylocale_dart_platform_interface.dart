import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'mylocale_dart_method_channel.dart';

abstract class MylocaleDartPlatform extends PlatformInterface {
  /// Constructs a MylocaleDartPlatform.
  MylocaleDartPlatform() : super(token: _token);

  static final Object _token = Object();

  static MylocaleDartPlatform _instance = MethodChannelMylocaleDart();

  /// The default instance of [MylocaleDartPlatform] to use.
  ///
  /// Defaults to [MethodChannelMylocaleDart].
  static MylocaleDartPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [MylocaleDartPlatform] when
  /// they register themselves.
  static set instance(MylocaleDartPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
