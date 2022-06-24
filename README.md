<p align="center">
<a href="https://pub.dev/packages/flutter_survey_monkey"><img src="https://img.shields.io/pub/v/flutter_survey_monkey.svg" alt="Pub"></a>
<a href="https://github.com/msarkrish/flutter_survey_monkey"><img src="https://img.shields.io/github/stars/msarkrish/flutter_survey_monkey.svg?style=flat&logo=github&colorB=deeppink&label=stars" alt="Star on Github"></a>
<a href="https://opensource.org/licenses/MIT"><img src="https://img.shields.io/badge/license-MIT-purple.svg" alt="License: MIT"></a>
<span class="badge-buymeacoffee">
<a href="https://www.buymeacoffee.com/MSARKrish"><img src="https://img.shields.io/badge/buy%20me%20a%20coffee-donate-yellow.svg" alt="Buy Me A Coffee donate button" /></a>
</span>
</p>

# Flutter SurveyMonkey

A plugin allows you to integrate your [SurveyMonkey](https://www.surveymonkey.com/) survey into your Flutter application for Android and iOS(Development Pending).

If your project uses Flutter SurveyMonkey, let me know by creating a new issue or PR! 🤗

## Currently supported features
* Getting Survey Status
* Getting Survey Response

## Compatibility Chart

|             | Android | iOS    |
|-------------|---------|--------|
| **Support** | SDK 21+ |        |

| API                   | Android            | iOS                | 
| --------------------- | ------------------ | ------------------ | 
| getSurveyStatus()     | :white_check_mark: | :x: | 
| getSurveyResponse()   | :white_check_mark: | :x: | 

## Getting started

In the `pubspec.yaml` of your flutter project, add the following dependency:

```yaml
dependencies:
  ...
  flutter_survey_monkey: ^0.0.1
```

In your project add the following import:

```dart
import 'package:flutter_survey_monkey/flutter_survey_monkey.dart';
```

### Android

Set the `minSdkVersion` in `android/app/build.gradle`:

```groovy
android {
    defaultConfig {
        minSdkVersion 21
    }
}
```

#### Getting Survey Status

getSurveyStatus method will return true if the user successfully completes the survey by answering all of the required questions. It will return false if the user did not complete the survey or if the provided Survey Hash is invalid or if any other problem occurs while the plugin is trying to open the survey for you. customVariables is optional.
```dart
try {
  ///Replace empty string with your Survey Hash value
  bool surveyStatus = await _flutterSurveyMonkeyPlugin
          .getSurveyStatus(surveyHash: "",customVariables:{}) ??
      false;
  debugPrint("Survey Status: ${surveyStatus.toString()}");
} catch (exception, stackTrace) {
  debugPrint("Exception is: ${exception.toString()}");
  debugPrint("StackTrace is: ${stackTrace.toString()}");
}
```

Sample Output:
Example: 1(True case)
```dart
true
```

Example: 2(False case)
```dart
false
```

#### Getting Survey Response

getSurveyResponse method will return true as surveyCompleted in the map, along with all of the questions and answers as surveyResponse, if the user completes the survey successfully by answering all of the required questions. It will return false as surveyStatus in the map if the user did not fill out all of the required questions, or if the provided Survey Hash is invalid, or if any other problem occurs while the plugin is trying to open the survey for you. customVariables is optional.
```dart
try {
  ///Replace empty string with your Survey Hash value
  Map surveyResponse = await _flutterSurveyMonkeyPlugin
          .getSurveyResponse(surveyHash: "",customVariables:{}) ??
      {};
  debugPrint("Survey Response: ${surveyResponse.toString()}");
} catch (exception, stackTrace) {
  debugPrint("Exception is: ${exception.toString()}");
  debugPrint("StackTrace is: ${stackTrace.toString()}");
}
```
Sample Output:
Example: 1(True case)
```dart
{'surveyCompleted': true,'surveyResponse': {'question1': 'Do you like this plugin?','answer1':'Yes'}}
```

Example: 2(False case)
```dart
{'surveyCompleted': false}
```

## Find this library useful? :heart:
Support it by joining __[stargazers](https://github.com/msarkrish/flutter_survey_monkey/stargazers)__ for this repository. :star:

## Example Usage

See [Example Code](example/lib/main.dart) for more info.

## Issues & Feedback

Please file an [issue](https://github.com/msarkrish/flutter_survey_monkey/issues) to send feedback or report a bug,  
If you want to ask a question or suggest an idea then you can [open an discussion](https://github.com/msarkrish/flutter_survey_monkey/discussions).  
Thank you!

## Contributing

All kind of contributions are Welcome.
* If you have a mac and SurveyHash value then you can submit pull request iOS implementation.
* Fix grammer mistake.
* Create issue.
* Fix issue by submitting pull request.
