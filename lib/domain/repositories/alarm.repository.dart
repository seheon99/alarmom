// Package imports:
import 'package:alarm/alarm.dart';

abstract class AlarmRepository {
  Future<AlarmSettings> createAlarm({
    required DateTime dateTime,
    required String assetAudioPath,
  });

  Future<void> deleteAlarm(int id);

  Future<void> updateAlarm(
    int id, {
    required DateTime dateTime,
    required String assetAudioPath,
  });

  Future<void> getAlarm(int id);

  Future<void> getAlarms();
}
