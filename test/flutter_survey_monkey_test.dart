import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_survey_monkey/flutter_survey_monkey.dart';
import 'package:flutter_survey_monkey/flutter_survey_monkey_platform_interface.dart';
import 'package:flutter_survey_monkey/flutter_survey_monkey_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterSurveyMonkeyPlatform 
    with MockPlatformInterfaceMixin
    implements FlutterSurveyMonkeyPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterSurveyMonkeyPlatform initialPlatform = FlutterSurveyMonkeyPlatform.instance;

  test('$MethodChannelFlutterSurveyMonkey is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterSurveyMonkey>());
  });

  test('getPlatformVersion', () async {
    FlutterSurveyMonkey flutterSurveyMonkeyPlugin = FlutterSurveyMonkey();
    MockFlutterSurveyMonkeyPlatform fakePlatform = MockFlutterSurveyMonkeyPlatform();
    FlutterSurveyMonkeyPlatform.instance = fakePlatform;
  
    expect(await flutterSurveyMonkeyPlugin.getPlatformVersion(), '42');
  });
}
