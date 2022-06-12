import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_survey_monkey/flutter_survey_monkey_platform_interface.dart';
import 'package:flutter_survey_monkey/flutter_survey_monkey_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterSurveyMonkeyPlatform
    with MockPlatformInterfaceMixin
    implements FlutterSurveyMonkeyPlatform {
  @override
  Future<Map<String, dynamic>?> getSurveyResponse(
      {required String surveyHash, Map<String, dynamic>? customVariables}) {
    return Future.value({'surveyStatus': false});
  }

  @override
  Future<bool?> getSurveyStatus(
      {required String surveyHash, Map<String, dynamic>? customVariables}) {
    return Future.value(false);
  }
}

void main() {
  final FlutterSurveyMonkeyPlatform flutterSurveyMonekeyInstance =
      FlutterSurveyMonkeyPlatform.instance;

  test('$MethodChannelFlutterSurveyMonkey is the default instance', () {
    expect(flutterSurveyMonekeyInstance,
        isInstanceOf<MethodChannelFlutterSurveyMonkey>());
  });

  // test('getPlatformVersion', () async {
  //   FlutterSurveyMonkey flutterSurveyMonkeyPlugin = FlutterSurveyMonkey();
  //   MockFlutterSurveyMonkeyPlatform fakePlatform =
  //       MockFlutterSurveyMonkeyPlatform();
  //   FlutterSurveyMonkeyPlatform.instance = fakePlatform;

  //   expect(
  //       await flutterSurveyMonkeyPlugin.getSurveyStatus(surveyHash: "Flutter"),
  //       throwsA(isA<UnimplementedError>()));
  // });
}
