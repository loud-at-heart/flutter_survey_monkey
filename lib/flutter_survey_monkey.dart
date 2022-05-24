import 'flutter_survey_monkey_platform_interface.dart';

class FlutterSurveyMonkey {
  Future<String?> openSurvey({required String surveyHash}) {
    return FlutterSurveyMonkeyPlatform.instance
        .openSurvey(surveyHash: surveyHash);
  }
}
