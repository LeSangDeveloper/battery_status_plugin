#import "BatteryStatusPlugin.h"
#if __has_include(<battery_status_plugin/battery_status_plugin-Swift.h>)
#import <battery_status_plugin/battery_status_plugin-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "battery_status_plugin-Swift.h"
#endif

@implementation BatteryStatusPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftBatteryStatusPlugin registerWithRegistrar:registrar];
}
@end
