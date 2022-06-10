import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_survey_monkey_method_channel.dart';

abstract class FlutterSurveyMonkeyPlatform extends PlatformInterface {
  /// Constructs a FlutterSurveyMonkeyPlatform.
  FlutterSurveyMonkeyPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterSurveyMonkeyPlatform _instance =
      MethodChannelFlutterSurveyMonkey();

  /// The default instance of [FlutterSurveyMonkeyPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterSurveyMonkey].
  static FlutterSurveyMonkeyPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterSurveyMonkeyPlatform] when
  /// they register themselves.
  static set instance(FlutterSurveyMonkeyPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<bool?> getSurveyStatus(
      {required String surveyHash, Map<String, dynamic>? customVariables}) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<Map?> getSurveyResponse(
      {required String surveyHash, Map<String, dynamic>? customVariables});
}
