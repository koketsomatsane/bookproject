import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "Gilded Cage", home: HomeScreen());
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text("The Gilded Cage"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome Readers!",
              style: TextStyle(
                color: Colors.black,
                fontStyle: FontStyle.italic,
                fontSize: 25,
              ),
            ),

            const SizedBox(height: 15),

            Text(
              "Curated By KM!",
              style: TextStyle(
                color: Colors.black,
                fontStyle: FontStyle.italic,
                fontSize: 30,
              ),
            ),

            const SizedBox(height: 15),

            Icon(Icons.book_rounded, size: 60),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                print("Button clicked!");
              },
              child: Text("Start Reading"),
            ),
          ],
        ),
      ),
    );
  }
}

class ReadingScreen extends StatefulWidget {
  const ReadingScreen({super.key});

  @override
  State<ReadingScreen> createState() => _ReadingScreenState();
}

class _ReadingScreenState extends State<ReadingScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
