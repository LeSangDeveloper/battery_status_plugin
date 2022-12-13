
import 'package:battery_status_plugin/battery_status_api.dart';

import 'battery_status_plugin_platform_interface.dart';

class BatteryStatusPlugin extends BatteryStatusPluginPlatform {

  @override
  Future<String?> getPlatformVersion() {
    return BatteryStatusPluginPlatform.instance.getPlatformVersion();
  }

  @override
  Future<BatteryStatusResult> getBatteryStatus(String messageFromPlugin) {
    return BatteryStatusPluginPlatform.instance.getBatteryStatus(messageFromPlugin);
  }
}
