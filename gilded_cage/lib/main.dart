import 'package:flutter/material.dart';
import 'package:gilded_cage/screens/admin_login_screen.dart';
import 'package:gilded_cage/screens/register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "Gilded Cage", home: WelcomeScreen());
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [       
            const Text(
              'Gilded Cage',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),

            // Start Reading Button
            ElevatedButton(
              onPressed: () {
                // Navigates to the HomeScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RegisterScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 15,
                ),
              ),
              child: const Text(
                'Start Reading',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 14),
            TextButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AdminLoginScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.edit_note_rounded),
              label: const Text('Author workspace'),
            ),
          ],
        ),
      ),
    );
  }
}
