import Flutter
import UIKit

public class SwiftFlutterSurveyMonkeyPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_survey_monkey", binaryMessenger: registrar.messenger())
    let instance = SwiftFlutterSurveyMonkeyPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }
}
