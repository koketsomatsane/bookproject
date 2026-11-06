import 'package:flutter/material.dart';
import 'package:gilded_cage/screens/register.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4EEE9),
      appBar: AppBar(
        title: const Text('My Profile'),
        backgroundColor: const Color(0xFF29152A),
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const CircleAvatar(
            radius: 48,
            backgroundColor: Color(0xFFE8A7C4),
            child: Text(
              'R',
              style: TextStyle(
                fontFamily: 'serif',
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Color(0xFF29152A),
              ),
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Reader',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'serif',
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            'reader@example.com',
            textAlign: TextAlign.center,
            style: TextStyle(color: Color(0xFF806F7A)),
          ),
          const SizedBox(height: 28),
          const Text(
            'Reading journey',
            style: TextStyle(
              fontFamily: 'serif',
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(child: _stat('38%', 'Book read')),
              const SizedBox(width: 12),
              Expanded(child: _stat('4 days', 'Reading streak')),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(child: _stat('12', 'Saved lines')),
              const SizedBox(width: 12),
              Expanded(child: _stat('3', 'Chapters read')),
            ],
          ),
          const SizedBox(height: 28),
          const Text(
            'Preferences',
            style: TextStyle(
              fontFamily: 'serif',
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          _option(Icons.text_fields_rounded, 'Reading text size', 'Medium'),
          _option(Icons.dark_mode_outlined, 'Reading appearance', 'Light'),
          _option(
            Icons.notifications_none_rounded,
            'New chapter notifications',
            'Enabled',
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(
                context,
                MaterialPageRoute(builder: (context) => const RegisterScreen()),
              );
            },
            child: Text('Logout', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  Widget _stat(String value, String label) {
    return Container(
      height: 96,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            value,
            style: const TextStyle(
              fontFamily: 'serif',
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF29152A),
            ),
          ),
          Text(label, style: const TextStyle(color: Color(0xFF806F7A))),
        ],
      ),
    );
  }

  Widget _option(IconData icon, String title, String subtitle) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Icon(icon, color: const Color(0xFF9E2F5B)),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right_rounded),
      ),
    );
  }
}
