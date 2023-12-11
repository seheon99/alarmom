// Package imports:
import 'package:alarm/alarm.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:alarmom/presentation/providers/alarm.storage.provider.dart';

final alarmProvider =
    FutureProvider.autoDispose.family<AlarmSettings, int>((ref, id) async {
  final alarmStorage = await ref.watch(alarmStorageProvider.future);
  return alarmStorage.getAlarm(id);
});
