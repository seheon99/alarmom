// Package imports:
import 'package:alarm/alarm.dart';

// Project imports:
import 'package:alarmom/domain/commands/command.dart';

class EnableAlarmCommand extends Command {
  EnableAlarmCommand({
    required this.alarm,
  });

  final AlarmSettings alarm;

  Future<void> call() async {
    await Alarm.set(alarmSettings: alarm);
  }
}
