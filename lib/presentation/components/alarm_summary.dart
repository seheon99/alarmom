// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:alarm/alarm.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:alarmom/presentation/providers/disable_alarm.provider.dart';
import 'package:alarmom/presentation/providers/enable_alarm.provider.dart';

class AlarmSummary extends ConsumerStatefulWidget {
  const AlarmSummary({
    super.key,
    required this.alarm,
  });

  final AlarmSettings alarm;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AlarmSummaryState();
}

class _AlarmSummaryState extends ConsumerState<AlarmSummary> {
  bool _isEnabled = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final enableCommand = ref.watch(enableAlarmProvider(widget.alarm.id));
    final disableCommand = ref.watch(disableAlarmProvider(widget.alarm.id));

    bool isLoading = enableCommand.isLoading || disableCommand.isLoading;

    return Container(
      decoration: BoxDecoration(
        color: _isEnabled
            ? Theme.of(context).colorScheme.primaryContainer
            : Theme.of(context).colorScheme.surfaceVariant,
        borderRadius: BorderRadius.circular(20),
        shape: BoxShape.rectangle,
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '주중',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '7:00',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Mission',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
            Switch(
              value: _isEnabled,
              onChanged: isLoading
                  ? null
                  : (value) {
                      final commandProvider =
                          value ? enableCommand : disableCommand;
                      commandProvider.whenData((command) {
                        command();
                      });
                      setState(() => _isEnabled = value);
                    },
            )
          ],
        ),
      ),
    );
  }
}
