// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:alarmom/presentation/global_keys.dart';
import 'package:alarmom/presentation/pages/home/home.page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
