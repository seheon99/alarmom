// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:alarmom/data/sources/alarm.storage.dart';
import 'package:alarmom/presentation/providers/preference.provider.dart';

final alarmStorageProvider = FutureProvider<AlarmStorage>((ref) async {
  final sharedPreferences = await ref.watch(sharedPreferencesProvider.future);
  return AlarmStorage(pref: sharedPreferences);
});
