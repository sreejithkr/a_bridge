import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'a_bridge_platform_interface.dart';

/// An implementation of [ABridgePlatform] that uses method channels.
class MethodChannelABridge extends ABridgePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('a_bridge');

  @override
  Future<List<String>?> getArgumentList() async {
    final list = await methodChannel.invokeListMethod<String>('getArgumentList');
    return list;
  }
}
