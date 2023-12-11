// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:alarmom/domain/commands/disable_alarm.command.dart';

final disableAlarmProvider = FutureProvider.autoDispose
    .family<DisableAlarmCommand, int>((ref, id) async {
  return DisableAlarmCommand(id: id);
});
