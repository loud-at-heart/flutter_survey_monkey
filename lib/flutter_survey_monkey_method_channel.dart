import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_survey_monkey_platform_interface.dart';

/// An implementation of [FlutterSurveyMonkeyPlatform] that uses method channels.
class MethodChannelFlutterSurveyMonkey extends FlutterSurveyMonkeyPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel =
      const MethodChannel('com.muthuselviapps.flutter_survey_monkey');

  @override
  Future<bool?> getSurveyStatus(
      {required String surveyHash,
      Map<String, dynamic>? customVariables}) async {
    Map<String, dynamic> methodArguments = {'surveyHash': surveyHash};
    if (customVariables != null) {
      methodArguments['customVariables'] = customVariables;
    }
    final version = await methodChannel.invokeMethod<bool>(
        'getSurveyStatus', methodArguments);
    return version;
  }

  @override
  Future<Map?> getSurveyResponse(
      {required String surveyHash,
      Map<String, dynamic>? customVariables}) async {
    Map<String, dynamic> methodArguments = {'surveyHash': surveyHash};
    if (customVariables != null) {
      methodArguments['customVariables'] = customVariables;
    }
    final version = await methodChannel.invokeMethod<Map>(
        'getSurveyResponse', methodArguments);
    return version;
  }
}
