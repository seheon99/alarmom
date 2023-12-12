// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddAlarmPage extends ConsumerStatefulWidget {
  const AddAlarmPage({super.key});

  @override
  ConsumerState<AddAlarmPage> createState() => _AddAlarmPageState();
}

class _AddAlarmPageState extends ConsumerState<AddAlarmPage> {
  int _hour = DateTime.now().add(const Duration(minutes: 1)).hour;
  int _minute = DateTime.now().add(const Duration(minutes: 1)).minute;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Alarm'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        elevation: 0,
        onPressed: () {},
        label: SizedBox(
          width: MediaQuery.of(context).size.width - 20,
          child: const Text(
            'Save',
            textAlign: TextAlign.center,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        extendedPadding: const EdgeInsets.symmetric(horizontal: 0),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Column(
        children: [
          SizedBox(
            height: 200,
            child: Localizations.override(
              context: context,
              locale: const Locale('en'),
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.time,
                initialDateTime: DateTime.now().copyWith(
                  hour: _hour,
                  minute: _minute,
                ),
                onDateTimeChanged: (DateTime dateTime) {
                  setState(() {
                    _hour = dateTime.hour;
                    _minute = dateTime.minute;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
