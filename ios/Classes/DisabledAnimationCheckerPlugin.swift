import Flutter
import UIKit

public class DisabledAnimationCheckerPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "disabled_animation_checker", binaryMessenger: registrar.messenger())
    let instance = DisabledAnimationCheckerPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "isAnimationDisabled":
      result(MotionSettings.isReduceMotionEnabled())
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}

@objc class MotionSettings: NSObject {
  @objc static func isReduceMotionEnabled() -> Bool {
      return UIAccessibility.isReduceMotionEnabled
  }
}
