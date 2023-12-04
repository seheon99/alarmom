// Package imports:
import 'package:alarm/alarm.dart';

// Project imports:
import 'package:alarmom/data/sources/alarm.storage.dart';
import 'package:alarmom/domain/repositories/alarm.repository.dart';

class AlarmRepositoryImpl extends AlarmRepository {
  AlarmRepositoryImpl({
    required this.alarmStorage,
  });

  final AlarmStorage alarmStorage;

  @override
  Future<AlarmSettings> createAlarm({
    required DateTime dateTime,
    required String assetAudioPath,
  }) async {
    final alarm = await alarmStorage.createAlarm(
      dateTime: dateTime,
      assetAudioPath: assetAudioPath,
    );
    return alarm;
  }

  @override
  Future<void> deleteAlarm(int id) async {
    await alarmStorage.deleteAlarm(id);
  }

  @override
  Future<void> updateAlarm(
    int id, {
    DateTime? dateTime,
    String? assetAudioPath,
  }) async {
    final alarm = await alarmStorage.getAlarm(id);
    await alarmStorage.saveAlarm(
      alarm.copyWith(
        dateTime: dateTime,
        assetAudioPath: assetAudioPath,
      ),
    );
  }

  @override
  Future<AlarmSettings> getAlarm(int id) async {
    return await alarmStorage.getAlarm(id);
  }

  @override
  Future<List<AlarmSettings>> getAlarms() async {
    return await alarmStorage.getAlarms();
  }
}
