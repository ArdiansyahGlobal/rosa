import 'package:flutter/material.dart';
import 'dart:async';

class EventScreen extends StatelessWidget {
  final String eventId;

  const EventScreen({super.key, required this.eventId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Event Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Details for event ID: $eventId'),
            const SizedBox(height: 20),
            _buildRealTimeClock(),
          ],
        ),
      ),
    );
  }

  Widget _buildRealTimeClock() {
    return StreamBuilder<DateTime>(
      stream: Stream<DateTime>.periodic(const Duration(seconds: 1), (int count) => DateTime.now()), // Perbaiki bagian ini
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final currentTime = snapshot.data!;
          return Text(
            'Current Time: ${currentTime.hour}:${currentTime.minute}:${currentTime.second}',
            style: const TextStyle(fontSize: 24),
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
