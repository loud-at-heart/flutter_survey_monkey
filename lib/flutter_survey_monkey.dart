import 'dart:io';

import 'flutter_survey_monkey_platform_interface.dart';

class FlutterSurveyMonkey {
  Future<bool?> getSurveyStatus(
      {required String surveyHash, Map<String, dynamic>? customVariables}) {
    if (Platform.isAndroid) {
      if (surveyHash.isEmpty) {
        throw Exception('SurveyHash must be a valid String');
      }
      return FlutterSurveyMonkeyPlatform.instance.getSurveyStatus(
          surveyHash: surveyHash, customVariables: customVariables);
    }
    throw UnimplementedError(
        'getSurveyStatus() has not been implemented for this platform ${Platform.operatingSystem}');
  }

  Future<Map?> getSurveyResponse(
      {required String surveyHash, Map<String, dynamic>? customVariables}) {
    if (Platform.isAndroid) {
      if (surveyHash.isEmpty) {
        throw Exception('SurveyHash must be a valid String');
      }
      return FlutterSurveyMonkeyPlatform.instance.getSurveyResponse(
          surveyHash: surveyHash, customVariables: customVariables);
    }
    throw UnimplementedError('getSurveyStatus() has not been implemented.');
  }
}
