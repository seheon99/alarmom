// Package imports:
import 'package:alarm/alarm.dart';

// Project imports:
import 'package:alarmom/domain/commands/command.dart';

class SetAlarmCommand extends Command {
  SetAlarmCommand({
    required this.id,
    required this.at,
    required this.audioPath,
  });

  final int id;
  final DateTime at;
  final String audioPath;

  Future<void> call() async {
    final settings = AlarmSettings(
      id: id,
      dateTime: at,
      assetAudioPath: audioPath,
      notificationTitle: '알라맘',
      notificationBody: '일어날 시간이에요!',
    );
    await Alarm.set(
      alarmSettings: settings,
    );
  }
}
