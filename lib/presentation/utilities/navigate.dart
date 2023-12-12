// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:alarmom/presentation/global_keys.dart';

Widget navigate(Widget widget, {bool clearStack = false}) {
  final navigator = navigatorKey.currentState;
  if (navigator != null) {
    Future.microtask(() {
      navigator.pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (_) => widget,
        ),
        (_) => clearStack,
      );
    });
  }
  return const SizedBox.shrink();
}
