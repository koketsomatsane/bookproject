import 'package:flutter/material.dart';

class ReadingScreen extends StatefulWidget {
  const ReadingScreen({super.key});

  @override
  State<ReadingScreen> createState() => _ReadingScreenState();
}

class _ReadingScreenState extends State<ReadingScreen> {
  double _fontSize = 19;
  bool _nightMode = false;

  @override
  Widget build(BuildContext context) {
    final background = _nightMode ? const Color(0xFF17131A) : const Color(0xFFFDF9F2);
    final textColor = _nightMode ? const Color(0xFFEDE4E6) : const Color(0xFF342F32);

    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        foregroundColor: textColor,
        elevation: 0,
        title: Text(
          'Chapter Three',
          style: TextStyle(fontFamily: 'serif', color: textColor),
        ),
        actions: [
          IconButton(
            tooltip: _nightMode ? 'Use light theme' : 'Use night theme',
            onPressed: () => setState(() => _nightMode = !_nightMode),
            icon: Icon(
              _nightMode ? Icons.light_mode_outlined : Icons.dark_mode_outlined,
            ),
          ),
          PopupMenuButton<double>(
            tooltip: 'Reading size',
            icon: const Icon(Icons.text_fields_rounded),
            onSelected: (value) => setState(() => _fontSize = value),
            itemBuilder: (context) => const [
              PopupMenuItem(value: 17, child: Text('Small text')),
              PopupMenuItem(value: 19, child: Text('Medium text')),
              PopupMenuItem(value: 22, child: Text('Large text')),
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: SelectionArea(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(24, 18, 24, 80),
            children: [
              Text(
                'The second key',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: textColor,
                  fontFamily: 'serif',
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 28),
              Text(
                'The key was warmer than it had any right to be.',
                style: TextStyle(
                  color: textColor,
                  fontFamily: 'serif',
                  fontSize: _fontSize,
                  height: 1.8,
                ),
              ),
              const SizedBox(height: 18),
              Text(
                'Amara held it beneath the candlelight and watched the small golden teeth catch the flame. Beyond the locked door, the house had fallen quiet. Even the walls seemed to be listening.',
                style: TextStyle(
                  color: textColor,
                  fontFamily: 'serif',
                  fontSize: _fontSize,
                  height: 1.8,
                ),
              ),
              const SizedBox(height: 18),
              Text(
                'She knew she should put it down. She knew every beautiful thing in the cage had been placed there for a reason. Yet something inside her answered the warmth—not with fear, but with recognition.',
                style: TextStyle(
                  color: textColor,
                  fontFamily: 'serif',
                  fontSize: _fontSize,
                  height: 1.8,
                ),
              ),
              const SizedBox(height: 18),
              Text(
                'Behind the final door, someone breathed her name.',
                style: TextStyle(
                  color: textColor,
                  fontFamily: 'serif',
                  fontSize: _fontSize,
                  height: 1.8,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: background,
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 18),
        child: Row(
          children: [
            const Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Chapter 3 of 12'),
                  SizedBox(height: 4),
                  LinearProgressIndicator(
                    value: 0.38,
                    minHeight: 4,
                    backgroundColor: Color(0xFFDDD2D6),
                    color: Color(0xFF9E2F5B),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 18),
            FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: const Color(0xFF9E2F5B),
              ),
              onPressed: () {},
              child: const Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
