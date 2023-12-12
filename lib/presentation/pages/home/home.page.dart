// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:alarm/alarm.dart';

// Project imports:
import 'package:alarmom/presentation/components/alarm_summary.dart';
import 'package:alarmom/presentation/pages/add_alarm/add_alarm.page.dart';
import 'package:alarmom/presentation/utilities/navigate.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alarmom'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigate(const AddAlarmPage());
        },
        child: const Icon(Icons.add),
      ),
      body: const _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: AlarmSummary(
        alarm: AlarmSettings(
          id: 1,
          dateTime: DateTime.now(),
          assetAudioPath: 'assets/audio/alarm_sound.mp3',
        ),
      ),
    );
  }
}
