// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:alarmom/domain/commands/enable_alarm.command.dart';
import 'package:alarmom/presentation/providers/alarm.provider.dart';

final enableAlarmProvider =
    FutureProvider.autoDispose.family<EnableAlarmCommand, int>((ref, id) async {
  final alarm = await ref.watch(alarmProvider(id).future);
  return EnableAlarmCommand(alarm: alarm);
});
