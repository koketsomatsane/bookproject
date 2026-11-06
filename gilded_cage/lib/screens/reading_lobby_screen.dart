import 'package:flutter/material.dart';
import 'package:gilded_cage/screens/reading_screen.dart';

class ReadingLobbyScreen extends StatelessWidget {
  const ReadingLobbyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final chapters = [
      ('01', 'The invitation', 'Published', true),
      ('02', 'A room of gold', 'Published', true),
      ('03', 'The second key', 'Continue here', false),
      ('04', 'What the cage remembers', 'Coming next', false),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF4EEE9),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.white,
                      ),
                      icon: const Icon(Icons.arrow_back_rounded),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'The Gilded Cage',
                      style: TextStyle(
                        fontFamily: 'serif',
                        fontSize: 36,
                        height: 1.05,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF29152A),
                      ),
                    ),
                    const SizedBox(height: 7),
                    const Text(
                      'Koketso Matsane',
                      style: TextStyle(
                        color: Color(0xFF866D81),
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF29152A),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Continue reading',
                            style: TextStyle(
                              color: Color(0xFFD8B76B),
                              letterSpacing: 1.3,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Chapter 3 — The second key',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'serif',
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 18),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: const LinearProgressIndicator(
                              value: 0.38,
                              minHeight: 7,
                              backgroundColor: Color(0xFF50394E),
                              color: Color(0xFFE8A7C4),
                            ),
                          ),
                          const SizedBox(height: 9),
                          const Text(
                            '38% complete',
                            style: TextStyle(color: Color(0xFFCDBECE)),
                          ),
                          const SizedBox(height: 18),
                          SizedBox(
                            width: double.infinity,
                            height: 52,
                            child: FilledButton.icon(
                              style: FilledButton.styleFrom(
                                backgroundColor: const Color(0xFFE8A7C4),
                                foregroundColor: const Color(0xFF29152A),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14),
                                ),
                              ),
                              onPressed: () => _openReader(context),
                              icon: const Icon(Icons.menu_book_rounded),
                              label: const Text(
                                'Open Chapter 3',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 28),
                    const Text(
                      'Chapters',
                      style: TextStyle(
                        fontFamily: 'serif',
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF29152A),
                      ),
                    ),
                    const SizedBox(height: 14),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 30),
              sliver: SliverList.builder(
                itemCount: chapters.length,
                itemBuilder: (context, index) {
                  final chapter = chapters[index];
                  final available = chapter.$4 || index == 2;
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Material(
                      color: available ? Colors.white : const Color(0xFFEBE4E2),
                      borderRadius: BorderRadius.circular(18),
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 7,
                        ),
                        leading: Text(
                          chapter.$1,
                          style: TextStyle(
                            fontFamily: 'serif',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: available
                                ? const Color(0xFF9E2F5B)
                                : const Color(0xFF9A8C97),
                          ),
                        ),
                        title: Text(
                          chapter.$2,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: available
                                ? const Color(0xFF29152A)
                                : const Color(0xFF776873),
                          ),
                        ),
                        subtitle: Text(
                          chapter.$3,
                          style: TextStyle(
                            color: index == 2
                                ? const Color(0xFF9E2F5B)
                                : const Color(0xFF8A7D86),
                          ),
                        ),
                        trailing: Icon(
                          available
                              ? Icons.play_arrow_rounded
                              : Icons.lock_outline_rounded,
                        ),
                        onTap: available ? () => _openReader(context) : null,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _openReader(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ReadingScreen()),
    );
  }
}
