// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:alarm/alarm.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:alarmom/presentation/app.dart';

void main() async {
  await Alarm.init();

  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}
