import 'a_bridge_platform_interface.dart';

class ABridge {
  static const argListKey = "arg_list";

  late ABridgePlatformInterface _instance;

  ABridge._(ABridgePlatformInterface instance) {
      _instance = instance;
  }

  factory ABridge.withDependency(ABridgePlatformInterface instance) =>  ABridge._(instance);

  ABridge() {
    ABridge._(ABridgePlatform.instance);
  }

  Future<List<String>?> getArgumentList() {
    return _instance.getArgumentList();
  }

  Future<Map<String,dynamic>?> getArgumentPair({String separator = "="}) {
    return getArgumentList()
        .then((args) => (args == null) ? null : _parseArguments(args,separator: separator));
  }

  Map<String, dynamic> _parseArguments(List<String> args,{String separator = "="}) {
    Map<String, dynamic> argMap = {};
    List<String> argList = [];

    for (String arg in args) {
      if (arg.startsWith('--')) {
        // Splitting argument by '=' to separate key and value
        List<String> parts = arg.substring(2).split(separator);
        if (parts.length == 2) {
          String key = parts[0];
          String value = parts[1];
          argMap[key] = value;
        } else {
          argList.add(arg);
        }
      } else {
        argList.add(arg);
      }
    }

    argMap["arg_list"] = argList;
    return argMap;
  }



}
