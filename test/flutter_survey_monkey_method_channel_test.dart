// import 'package:flutter/services.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:flutter_survey_monkey/flutter_survey_monkey_method_channel.dart';

// void main() {
//   MethodChannelFlutterSurveyMonkey platform = MethodChannelFlutterSurveyMonkey();
//   const MethodChannel channel = MethodChannel('flutter_survey_monkey');

//   TestWidgetsFlutterBinding.ensureInitialized();

//   setUp(() {
//     channel.setMockMethodCallHandler((MethodCall methodCall) async {
//       return '42';
//     });
//   });

//   tearDown(() {
//     channel.setMockMethodCallHandler(null);
//   });

//   test('getPlatformVersion', () async {
//     expect(await platform.getPlatformVersion(), '42');
//   });
// }
