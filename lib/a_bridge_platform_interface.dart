import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'a_bridge_method_channel.dart';


abstract class ABridgePlatformInterface  {
  Future<List<String>?> getArgumentList();
}

abstract class ABridgePlatform extends PlatformInterface implements ABridgePlatformInterface {
  /// Constructs a ABridgePlatform.
  ABridgePlatform() : super(token: _token);

  static final Object _token = Object();

  static ABridgePlatform _instance = MethodChannelABridge();

  /// The default instance of [ABridgePlatform] to use.
  ///
  /// Defaults to [MethodChannelABridge].
  static ABridgePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ABridgePlatform] when
  /// they register themselves.
  static set instance(ABridgePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  @override
  Future<List<String>?> getArgumentList() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
