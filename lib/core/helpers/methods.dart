import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String formatToMonthYear(DateTime date) {
  return DateFormat('MMMM yyyy').format(date);
}



Future<TimeOfDay> selectTime(BuildContext context) async {
  final TimeOfDay? pickedTime = await showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
  );

  return pickedTime ?? TimeOfDay.now();
}
