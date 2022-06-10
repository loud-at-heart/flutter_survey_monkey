import 'flutter_survey_monkey_platform_interface.dart';

class FlutterSurveyMonkey {
  Future<bool?> getSurveyStatus(
      {required String surveyHash, Map<String, dynamic>? customVariables}) {
    return FlutterSurveyMonkeyPlatform.instance.getSurveyStatus(
        surveyHash: surveyHash, customVariables: customVariables);
  }

  Future<Map?> getSurveyResponse(
      {required String surveyHash, Map<String, dynamic>? customVariables}) {
    return FlutterSurveyMonkeyPlatform.instance.getSurveyResponse(
        surveyHash: surveyHash, customVariables: customVariables);
  }
}
