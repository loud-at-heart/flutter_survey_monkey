import 'package:flutter/material.dart';
import 'package:flutter_survey_monkey/flutter_survey_monkey.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final _flutterSurveyMonkeyPlugin = FlutterSurveyMonkey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Survey Monkey Example App'),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              ElevatedButton(
                onPressed: () async {
                  try {
                    ///Replace empty string with your Survey Hash value
                    bool surveyStatus = await _flutterSurveyMonkeyPlugin
                            .getSurveyStatus(surveyHash: "") ??
                        false;
                    debugPrint("Survey Status: ${surveyStatus.toString()}");
                  } catch (exception, stackTrace) {
                    debugPrint("Exception is: ${exception.toString()}");
                    debugPrint("StackTrace is: ${stackTrace.toString()}");
                  }
                },
                child: const Text('Get Survey Status'),
              ),
              ElevatedButton(
                onPressed: () async {
                  try {
                    ///Replace empty string with your Survey Hash value
                    Map surveyResponse = await _flutterSurveyMonkeyPlugin
                            .getSurveyResponse(surveyHash: "") ??
                        {};
                    debugPrint("Survey Response: ${surveyResponse.toString()}");
                  } catch (exception, stackTrace) {
                    debugPrint("Exception is: ${exception.toString()}");
                    debugPrint("StackTrace is: ${stackTrace.toString()}");
                  }
                },
                child: const Text('Get Survey Response'),
              ),
            ]),
      ),
    );
  }
}
