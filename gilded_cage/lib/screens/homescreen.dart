import 'package:flutter/material.dart';
import 'package:gilded_cage/screens/reading_lobby_screen.dart';
import 'package:gilded_cage/screens/user_profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF18101A),
      drawer: _readerDrawer(context),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 18, 20, 32),
          children: [
            Row(
              children: [
                Builder(
                  builder: (context) => IconButton(
                    onPressed: () => Scaffold.of(context).openDrawer(),
                    tooltip: 'Open navigation',
                    style: IconButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: const Color(0xFF2B202D),
                    ),
                    icon: const Icon(Icons.menu_rounded),
                  ),
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'YOUR CURRENT CHAPTER',
                        style: TextStyle(
                          color: Color(0xFFBFA8C0),
                          fontSize: 11,
                          letterSpacing: 2,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'The Reading Room',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'serif',
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                CircleAvatar(
                  radius: 24,
                  backgroundColor: const Color(0xFF9E2F5B),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const UserProfileScreen(),
                        ),
                      );
                    },
                    color: Colors.white,
                    icon: const Icon(Icons.person_outline_rounded),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 28),
            Container(
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFF1C6DA), Color(0xFFE8A7C4)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(28),
              ),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final compact = constraints.maxWidth < 380;
                  final cover = _bookCover(compact ? 92 : 112);
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      cover,
                      const SizedBox(width: 20),
                      Expanded(child: _bookDetails(compact)),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 26),
            Row(
              children: [
                Expanded(
                  child: _statCard(
                    icon: Icons.local_fire_department_rounded,
                    value: '4 days',
                    label: 'reading streak',
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _statCard(
                    icon: Icons.format_quote_rounded,
                    value: '12',
                    label: 'saved lines',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 28),
            const Text(
              'Your secret keeper',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'serif',
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'Save the one line from this world you never want to forget.',
              style: TextStyle(
                color: Color(0xFFBFA8C0),
                height: 1.45,
              ),
            ),
            const SizedBox(height: 14),
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFF4A3749)),
              ),
              child: const Row(
                children: [
                  Icon(
                    Icons.auto_fix_high_rounded,
                    color: Color(0xFFD8B76B),
                  ),
                  SizedBox(width: 14),
                  Expanded(
                    child: Text(
                      '“Some cages are built from gold. Others are built from love.”',
                      style: TextStyle(
                        color: Color(0xFFF4ECF3),
                        fontFamily: 'serif',
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                        height: 1.45,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bookCover(double width) {
    return Container(
      width: width,
      height: width * 1.5,
      decoration: BoxDecoration(
        color: const Color(0xFF2B1719),
        borderRadius: BorderRadius.circular(5),
        boxShadow: const [
          BoxShadow(
            color: Color(0x55000000),
            blurRadius: 18,
            offset: Offset(8, 8),
          ),
        ],
      ),
      child: Container(
        margin: const EdgeInsets.fromLTRB(8, 7, 7, 8),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFC9A15A)),
          color: const Color(0xFF33211B),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.lock_outline_rounded,
              color: Color(0xFFD8B76B),
              size: 26,
            ),
            SizedBox(height: 16),
            Text(
              'THE\nGILDED\nCAGE',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFFE9D39D),
                fontFamily: 'serif',
                fontSize: 13,
                height: 1.15,
                letterSpacing: 1,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bookDetails(bool compact) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
          decoration: BoxDecoration(
            color: const Color(0xFF29152A),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Text(
            '38% READ',
            style: TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'The Gilded Cage',
          style: TextStyle(
            color: const Color(0xFF29152A),
            fontFamily: 'serif',
            fontSize: compact ? 20 : 25,
            height: 1,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'by Koketso Matsane',
          style: TextStyle(color: Color(0xFF715C71), fontSize: 13),
        ),
        const SizedBox(height: 18),
        SizedBox(
          height: 46,
          child: FilledButton.icon(
            style: FilledButton.styleFrom(
              backgroundColor: const Color(0xFF29152A),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ReadingLobbyScreen(),
                ),
              );
            },
            icon: const Icon(Icons.menu_book_rounded, size: 19),
            label: const Text('Continue'),
          ),
        ),
      ],
    );
  }

  Widget _statCard({
    required IconData icon,
    required String value,
    required String label,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF2B202D),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFFE5BFD2)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  value,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  label,
                  style: const TextStyle(
                    color: Color(0xFFBFA8C0),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _readerDrawer(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFFFDF9FB),
      child: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 22, 20, 24),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 27,
                    backgroundColor: Color(0xFF29152A),
                    child: Icon(
                      Icons.person_rounded,
                      color: Color(0xFFE8A7C4),
                      size: 30,
                    ),
                  ),
                  SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Reader',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                        Text(
                          'Your reading library',
                          style: TextStyle(
                            color: Color(0xFF806F7A),
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: 1),
            const SizedBox(height: 12),
            _drawerItem(
              icon: Icons.home_outlined,
              label: 'Overview',
              selected: true,
              onTap: () => Navigator.pop(context),
            ),
            _drawerItem(
              icon: Icons.menu_book_outlined,
              label: 'Read',
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ReadingLobbyScreen(),
                  ),
                );
              },
            ),
            _drawerItem(
              icon: Icons.bookmark_border_rounded,
              label: 'Saved lines',
              onTap: () => Navigator.pop(context),
            ),
            _drawerItem(
              icon: Icons.person_outline_rounded,
              label: 'Profile',
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UserProfileScreen(),
                  ),
                );
              },
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                'THE GILDED CAGE',
                style: TextStyle(
                  color: const Color(0xFF29152A).withValues(alpha: 0.45),
                  fontFamily: 'serif',
                  letterSpacing: 2,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _drawerItem({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    bool selected = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
      child: ListTile(
        selected: selected,
        selectedTileColor: const Color(0xFFF0DDE6),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        leading: Icon(
          icon,
          color: selected ? const Color(0xFF9E2F5B) : const Color(0xFF6A5965),
        ),
        title: Text(
          label,
          style: TextStyle(
            color: selected ? const Color(0xFF29152A) : const Color(0xFF6A5965),
            fontWeight: selected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}