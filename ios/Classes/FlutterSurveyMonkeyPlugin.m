#import "FlutterSurveyMonkeyPlugin.h"
#if __has_include(<flutter_survey_monkey/flutter_survey_monkey-Swift.h>)
#import <flutter_survey_monkey/flutter_survey_monkey-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_survey_monkey-Swift.h"
#endif

@implementation FlutterSurveyMonkeyPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterSurveyMonkeyPlugin registerWithRegistrar:registrar];
}
@end
