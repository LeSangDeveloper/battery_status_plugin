import 'package:pigeon/pigeon.dart';

enum State { success, error }

class BatteryStatusResult {
  final State state;
  final String message;

  BatteryStatusResult(this.state, this.message);
}

@HostApi()
abstract class BatteryStatusApi {
  @async
  BatteryStatusResult getBatteryStatus(String messageFromPlugin);
}