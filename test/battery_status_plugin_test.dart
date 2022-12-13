import 'package:battery_status_plugin/battery_status_api.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:battery_status_plugin/battery_status_plugin.dart';
import 'package:battery_status_plugin/battery_status_plugin_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockBatteryStatusPluginPlatform
    with MockPlatformInterfaceMixin
    implements BatteryStatusPluginPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<BatteryStatusResult> getBatteryStatus(String messageFromPlugin) {
    // TODO: implement getBatteryStatus
    throw UnimplementedError();
  }
}

void main() {

}
