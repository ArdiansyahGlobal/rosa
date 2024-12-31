import 'package:flutter/material.dart';
import '../models/event_model.dart';
import '../widgets/custom_calendar.dart';
import '../widgets/event_card.dart';
import '../utils/date_comparison.dart'; // Import ekstensi dari folder utils

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  final List<Event> _events = [
    Event(id: '1', title: 'Meeting', date: DateTime.now(), time: TimeOfDay(hour: 14, minute: 0)),
    Event(id: '2', title: 'Birthday Party', date: DateTime.now(), time: TimeOfDay(hour: 18, minute: 0)),
    Event(id: '3', title: 'Working', date: DateTime.now(), time: TimeOfDay(hour: 18, minute: 0)),
  ];

  DateTime _selectedDate = DateTime.now();

  // Fungsi untuk menambahkan event
  void _addEvent(String title, String time) {
    // Memisahkan string waktu menjadi jam dan menit
    List<String> timeParts = time.split(':');
    int hour = int.parse(timeParts[0]);  // Mengambil jam
    int minute = int.parse(timeParts[1]);  // Mengambil menit

    // Membuat objek TimeOfDay dari jam dan menit
    TimeOfDay eventTime = TimeOfDay(hour: hour, minute: minute);

    setState(() {
      _events.add(Event(
        id: DateTime.now().toString(),
        title: title,
        date: _selectedDate,
        time: eventTime,  // Gunakan TimeOfDay yang sudah dikonversi
      ));
    });
  }

  // Fungsi untuk menampilkan kalender dan memilih tanggal
  void _showCalendar() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return CustomCalendar(
          onDateSelected: (selectedDate) {
            setState(() {
              _selectedDate = selectedDate;
            });
            Navigator.pop(context); // Menutup kalender setelah memilih tanggal
            _showAddEventDialog(); // Tampilkan dialog untuk menambahkan event
          },
        );
      },
    );
  }

  // Menampilkan dialog untuk menambahkan event
  void _showAddEventDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController titleController = TextEditingController();
        TextEditingController timeController = TextEditingController();

        return AlertDialog(
          title: const Text('Add Event'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(labelText: 'Event Title'),
              ),
              TextField(
                controller: timeController,
                decoration: const InputDecoration(labelText: 'Event Time'),
                keyboardType: TextInputType.datetime,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (titleController.text.isNotEmpty && timeController.text.isNotEmpty) {
                  _addEvent(titleController.text, timeController.text);
                  Navigator.pop(context);
                }
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendar'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _showCalendar, // Menampilkan kalender ketika tombol tambah ditekan
          ),
        ],
      ),
      body: Column(
        children: [
          IconButton(
            icon: const Icon(Icons.calendar_today, size: 40),
            onPressed: _showCalendar, // Menampilkan kalender
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _events.where((event) => event.date.isSameDay(_selectedDate)).length,
              itemBuilder: (context, index) {
                var event = _events.where((event) => event.date.isSameDay(_selectedDate)).toList()[index];
                return EventCard(event: event); // Menampilkan event sesuai tanggal yang dipilih
              },
            ),
          ),
        ],
      ),
    );
  }
}
