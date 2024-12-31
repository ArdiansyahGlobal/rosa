import 'package:flutter/material.dart';

class CustomCalendar extends StatelessWidget {
  final Function(DateTime) onDateSelected;

  const CustomCalendar({Key? key, required this.onDateSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CalendarDatePicker(
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
      onDateChanged: onDateSelected,
    );
  }
}
