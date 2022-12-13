package com.example.battery_status_plugin;

import static android.content.Context.BATTERY_SERVICE;

import static androidx.core.content.ContextCompat.getSystemService;

import android.content.Intent;
import android.content.IntentFilter;
import android.os.BatteryManager;
import android.os.Build;

import androidx.annotation.NonNull;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.BasicMessageChannel;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.StandardMessageCodec;

/** BatteryStatusPlugin */
public class BatteryStatusPlugin extends FlutterActivity implements FlutterPlugin, BatteryStatus.BatteryStatusApi {

  @Override
  public void getBatteryStatus(@NonNull String messageFromPlugin, BatteryStatus.Result<BatteryStatus.BatteryStatusResult> result) {
    String message = "Unknown " + messageFromPlugin;

    int batteryLevel = getBatteryLevel();
    if (batteryLevel != -1) {
      BatteryStatus.BatteryStatusResult batteryStatus = new BatteryStatus.BatteryStatusResult.Builder()
              .setMessage(message + " " + batteryLevel)
              .setState(BatteryStatus.State.SUCCESS)
              .build();
      result.success(batteryStatus);
    } else {
      BatteryStatus.BatteryStatusResult batteryStatus = new BatteryStatus.BatteryStatusResult.Builder()
              .setMessage(message + " error")
              .setState(BatteryStatus.State.ERROR)
              .build();
      result.success(batteryStatus);
    }

  }

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding binding) {
    BatteryStatus.BatteryStatusApi.setup(binding.getBinaryMessenger(), this);
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    BatteryStatus.BatteryStatusApi.setup(binding.getBinaryMessenger(), null);
  }

  private int getBatteryLevel() {
    int batteryLevel = -1;
    if (Build.VERSION.SDK_INT == Build.VERSION_CODES.LOLLIPOP) {
      BatteryManager batteryManager = (BatteryManager) getSystemService(BATTERY_SERVICE);
      batteryLevel = batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY);
    } else {
      Intent intent = registerReceiver(null, new IntentFilter(Intent.ACTION_BATTERY_CHANGED));
      batteryLevel = intent.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) * 100 / intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1);
    }
    return batteryLevel;
  }
}