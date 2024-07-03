
import 'dart:ffi';

import 'a_bridge_platform_interface.dart';

class ABridge {
  Future<List<String>?> getArgumentList() {
    return ABridgePlatform.instance.getArgumentList();
  }
}
