// Package imports:
import 'package:alarm/alarm.dart';

// Project imports:
import 'package:alarmom/domain/commands/command.dart';

class DisableAlarmCommand extends Command {
  DisableAlarmCommand({
    required this.id,
  });

  final int id;

  Future<void> call() async {
    await Alarm.stop(id);
  }
}
