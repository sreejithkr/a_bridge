import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:a_bridge/a_bridge_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelABridge platform = MethodChannelABridge();
  const MethodChannel channel = MethodChannel('a_bridge');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return ['42'];
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  test('getArgumentList', () async {
    expect(await platform.getArgumentList(), ['42']);
  });
}
