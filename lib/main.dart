// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:alarm/alarm.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:alarmom/presentation/app.dart';
import 'package:alarmom/provider_logger.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Alarm.init();

  runApp(
    ProviderScope(
      observers: [
        ProviderLogger(),
      ],
      child: const App(),
    ),
  );
}
