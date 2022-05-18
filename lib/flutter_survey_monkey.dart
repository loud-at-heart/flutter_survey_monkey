
import 'flutter_survey_monkey_platform_interface.dart';

class FlutterSurveyMonkey {
  Future<String?> getPlatformVersion() {
    return FlutterSurveyMonkeyPlatform.instance.getPlatformVersion();
  }
}
