#include "include/battery_status_plugin/battery_status_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "battery_status_plugin.h"

void BatteryStatusPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  battery_status_plugin::BatteryStatusPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
