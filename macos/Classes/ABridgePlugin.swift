import Cocoa
import FlutterMacOS

public class ABridgePlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "a_bridge", binaryMessenger: registrar.messenger)
    let instance = ABridgePlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getArgumentList":
        result(CommandLine.arguments)
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
