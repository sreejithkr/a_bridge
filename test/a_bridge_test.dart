import 'package:flutter_test/flutter_test.dart';
import 'package:a_bridge/a_bridge.dart';
import 'package:a_bridge/a_bridge_platform_interface.dart';
import 'package:a_bridge/a_bridge_method_channel.dart';

class MockABridgePlatform implements ABridgePlatformInterface {
  List<String> argumentList = [];

  @override
  Future<List<String>?> getArgumentList() => Future.value(argumentList);
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  final MockABridgePlatform mockPlatform = MockABridgePlatform();
  late ABridge sut;

  setUp(() {
    sut = ABridge.withDependency(mockPlatform);
  });

  tearDown(() {});

  test('$MethodChannelABridge is the default instance', () {
    expect(mockPlatform, isInstanceOf<ABridgePlatformInterface>());
  });

  test('getArgumentList return the list from ABridgePlatformInterface ',
      () async {
    mockPlatform.argumentList = ["42"];
    expect((await sut.getArgumentList()), ['42']);
  });

  test('getArgumentList return the list from ABridgePlatformInterface ',
      () async {
    mockPlatform.argumentList = ["42", "--port=2345"];
    expect((await sut.getArgumentPair()), {
      ABridge.argListKey: ['42'],
      "port": "2345"
    });
  });
}
