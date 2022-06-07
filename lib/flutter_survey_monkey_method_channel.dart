import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_survey_monkey_platform_interface.dart';

/// An implementation of [FlutterSurveyMonkeyPlatform] that uses method channels.
class MethodChannelFlutterSurveyMonkey extends FlutterSurveyMonkeyPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_survey_monkey');

  @override
  Future<bool?> openSurvey(
      {required String surveyHash,
      Map<String, dynamic>? customVariables}) async {
    Map<String, dynamic> methodArguments = {'surveyHash': surveyHash};
    if (customVariables != null) {
      methodArguments['customVariables'] = customVariables;
    }
    final version =
        await methodChannel.invokeMethod<bool>('openSurvey', methodArguments);
    return version;
  }

  @override
  Future<Map?> openSurveyWithResult({required String surveyHash}) async {
    final version = await methodChannel
        .invokeMethod<Map>('openSurveyWithResult', {'surveyHash': surveyHash});
    return version;
  }
}
