import 'package:battery_status_plugin/battery_status_plugin_platform_interface.dart';

import 'battery_status_api.dart';

class PigeonBatteryStatus extends BatteryStatusPluginPlatform {
  final BatteryStatusApi _api = BatteryStatusApi();

  @override
  Future<String?> getPlatformVersion() {
    throw UnimplementedError('');
  }

  @override
  Future<BatteryStatusResult> getBatteryStatus(String messageFromPlugin) {
    return _api.getBatteryStatus(messageFromPlugin);
  }
}