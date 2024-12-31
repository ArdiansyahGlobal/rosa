import 'package:flutter/material.dart';
import 'calendar_screen.dart';
import 'settings_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ROSA - Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsScreen()),
              );
            },
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.pink, // Mengganti gradien dengan warna pink soft
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Menampilkan Logo ROSA
              Image.asset(
                'assets/icons/rosa.png', // Gantilah dengan lokasi logo ROSA
                height: 100, // Sesuaikan ukuran logo
                width: 100,
              ),
              const SizedBox(height: 20),
              const Text(
                'Welcome to ROSA!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Reminder of Social Activities', // Menambahkan kepanjangan ROSA
                style: TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.pink,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CalendarScreen()),
                  );
                },
                child: const Text('View Calendar'),
              ),
              const SizedBox(height: 20),
              IconButton(
                icon: const Icon(Icons.calendar_today, color: Colors.white, size: 40),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CalendarScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
