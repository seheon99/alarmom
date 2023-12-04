// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:alarm/alarm.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AlarmStorage {
  AlarmStorage({
    required this.pref,
  });

  final SharedPreferences pref;

  String _alarmKey(int id) => 'alarm-$id';

  Future<AlarmSettings> createAlarm({
    required DateTime dateTime,
    required String assetAudioPath,
  }) async {
    final id = DateTime.now().millisecondsSinceEpoch;
    final alarm = AlarmSettings(
      id: id,
      dateTime: dateTime,
      assetAudioPath: assetAudioPath,
    );
    await saveAlarm(alarm);
    return alarm;
  }

  Future<AlarmSettings> getAlarm(int id) async {
    final alarm = pref.getString(_alarmKey(id));
    if (alarm == null) {
      throw Exception('Alarm not found');
    }
    return AlarmSettings.fromJson(jsonDecode(alarm));
  }

  Future<List<AlarmSettings>> getAlarms() async {
    final keys = pref.getKeys().where((key) => key.startsWith('alarm-'));
    final alarms = <AlarmSettings>[];
    for (final key in keys) {
      final alarm = pref.getString(key);
      if (alarm != null) {
        alarms.add(AlarmSettings.fromJson(jsonDecode(alarm)));
      }
    }
    return alarms;
  }

  Future<void> saveAlarm(AlarmSettings alarm) async {
    await pref.setString(_alarmKey(alarm.id), jsonEncode(alarm.toJson()));
  }

  Future<void> deleteAlarm(int id) async {
    await pref.remove(_alarmKey(id));
  }
}
