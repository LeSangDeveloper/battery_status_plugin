#ifndef FLUTTER_PLUGIN_BATTERY_STATUS_PLUGIN_H_
#define FLUTTER_PLUGIN_BATTERY_STATUS_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace battery_status_plugin {

class BatteryStatusPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  BatteryStatusPlugin();

  virtual ~BatteryStatusPlugin();

  // Disallow copy and assign.
  BatteryStatusPlugin(const BatteryStatusPlugin&) = delete;
  BatteryStatusPlugin& operator=(const BatteryStatusPlugin&) = delete;

 private:
  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace battery_status_plugin

#endif  // FLUTTER_PLUGIN_BATTERY_STATUS_PLUGIN_H_
