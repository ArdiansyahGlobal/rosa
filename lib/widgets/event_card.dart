import 'package:flutter/material.dart';
import '../models/event_model.dart';

class EventCard extends StatelessWidget {
  final Event event;

  const EventCard({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ListTile(
        title: Text(event.title),
        subtitle: Text('Time: ${event.time?.format(context)}'),  // Menampilkan waktu dalam format TimeOfDay
        trailing: Text(event.date.toLocal().toString().split(' ')[0]),  // Menampilkan tanggal event
      ),
    );
  }
}
