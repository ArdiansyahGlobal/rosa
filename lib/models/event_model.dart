import 'package:flutter/material.dart';

class Event {
  final String id;
  final String title;
  final DateTime date;
  final TimeOfDay? time;  // Ganti tipe data menjadi TimeOfDay

  Event({
    required this.id,
    required this.title,
    required this.date,
    required this.time,
  });
}
