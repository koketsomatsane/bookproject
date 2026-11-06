import 'package:flutter/material.dart';

class AdminWorkspaceScreen extends StatelessWidget {
  const AdminWorkspaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F1F2),
      appBar: AppBar(
        title: const Text('Author Workspace'),
        backgroundColor: const Color(0xFF29152A),
        foregroundColor: Colors.white,
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xFF9E2F5B),
        foregroundColor: Colors.white,
        onPressed: () {},
        icon: const Icon(Icons.add_rounded),
        label: const Text('New chapter'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF29152A), Color(0xFF603653)],
              ),
              borderRadius: BorderRadius.circular(22),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Writing now',
                  style: TextStyle(
                    color: Color(0xFFE8A7C4),
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Chapter 4 — What the cage remembers',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'serif',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Draft saved locally',
                  style: TextStyle(color: Color(0xFFCDBECE)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Manuscript',
            style: TextStyle(
              fontFamily: 'serif',
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          _chapterTile('Chapter 3', 'The second key', 'Published', true),
          _chapterTile('Chapter 4', 'What the cage remembers', 'Draft', false),
          _chapterTile('Chapter 5', 'Untitled', 'Not started', false),
        ],
      ),
    );
  }

  Widget _chapterTile(String number, String title, String status, bool published) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor:
              published ? const Color(0xFFE8D8E1) : const Color(0xFFE8E5E5),
          child: Icon(
            published ? Icons.check_rounded : Icons.edit_outlined,
            color: published ? const Color(0xFF9E2F5B) : Colors.grey,
          ),
        ),
        title: Text('$number — $title'),
        subtitle: Text(status),
        trailing: const Icon(Icons.drag_handle_rounded),
      ),
    );
  }
}
