import 'flutter_survey_monkey_platform_interface.dart';

class FlutterSurveyMonkey {
  Future<bool?> openSurvey(
      {required String surveyHash, Map<String, dynamic>? customVariables}) {
    return FlutterSurveyMonkeyPlatform.instance
        .openSurvey(surveyHash: surveyHash, customVariables: customVariables);
  }

  Future<Map?> openSurveyWithResult({required String surveyHash}) {
    return FlutterSurveyMonkeyPlatform.instance
        .openSurveyWithResult(surveyHash: surveyHash);
  }
}
