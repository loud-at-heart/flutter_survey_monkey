import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_survey_monkey_platform_interface.dart';

/// An implementation of [FlutterSurveyMonkeyPlatform] that uses method channels.
class MethodChannelFlutterSurveyMonkey extends FlutterSurveyMonkeyPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_survey_monkey');

  @override
  Future<String?> openSurvey({required String surveyHash}) async {
    final version =
        await methodChannel.invokeMethod<String>('openSurvey', surveyHash);
    return version;
  }
}
