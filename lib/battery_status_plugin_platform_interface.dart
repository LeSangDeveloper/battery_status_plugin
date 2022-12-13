import 'package:battery_status_plugin/pigeon_battery_status.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'battery_status_api.dart';
import 'battery_status_plugin.dart';

abstract class BatteryStatusPluginPlatform extends PlatformInterface {
  /// Constructs a BatteryStatusPluginPlatform.
  BatteryStatusPluginPlatform() : super(token: _token);

  static final BatteryStatusPluginPlatform _instance = PigeonBatteryStatus();

  static BatteryStatusPluginPlatform get instance => _instance;

  static final Object _token = Object();

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<BatteryStatusResult> getBatteryStatus(String messageFromPlugin) {
    return BatteryStatusPluginPlatform.instance.getBatteryStatus(messageFromPlugin);
  }
}
