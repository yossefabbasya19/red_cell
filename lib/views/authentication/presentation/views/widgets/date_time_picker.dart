import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDateTimePicker extends StatelessWidget {
  final void Function(DateTime)onDateTimeChanged ;
  const MyDateTimePicker({super.key, required this.onDateTimeChanged});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: CupertinoDatePicker(
        mode: CupertinoDatePickerMode.date,
        initialDateTime: DateTime(1960, 1, 1),
        maximumDate: DateTime(2007, 1, 1),
        minimumDate: DateTime(1960, 1, 1),
        onDateTimeChanged: onDateTimeChanged,
      ),
    );
  }
}
