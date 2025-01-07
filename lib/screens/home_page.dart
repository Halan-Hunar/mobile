import 'package:flutter/material.dart';
import 'package:mobile/screens/TherapistConnectScreen.dart';
import '../pages/daily_journal.dart';
import '../pages/settings.dart';
import 'chat_screen.dart';
import 'guided_meditation_screen.dart';
import 'TherapistConnectScreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // Define pages for BottomNavigationBar
  static final List<Widget> _pages = [
    const HomeScreen(),
    const DailyJournalPage(),
    const GuidedMeditationScreen(),
    const TherapistConnectScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBEFF8), // Pastel background
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5A8C4), // Pastel pink
        title: const Text(
          'Welcome to CalmSpace',
          style: TextStyle(
            fontFamily: 'Quicksand',
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.white),
            onPressed: () {
              // Navigate to the settings page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AccessibilitySettingsPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.note_alt_rounded),
            label: 'Journal',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.self_improvement_rounded),
            label: 'Meditate',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_rounded),
            label: 'Therapist',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFFF5A8C4), // Pastel pink
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Hello there!',
            style: TextStyle(
              fontFamily: 'Quicksand',
              fontWeight: FontWeight.bold,
              fontSize: 28,
              color: Color(0xFF454545),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Let’s take a step towards mental well-being.',
            style: TextStyle(
              fontFamily: 'Quicksand',
              fontSize: 16,
              color: Color(0xFF7A7A7A),
            ),
          ),
          const SizedBox(height: 20),
          // Recommended Actions Section
          Expanded(
            child: ListView(
              children: [
                // Meditation Card
                _buildFeatureCard(
                  title: 'Meditation',
                  subtitle: 'Focus and relax with guided meditations',
                  icon: Icons.self_improvement_rounded,
                  color: const Color(0xFFC8E6C9), // Pastel green
                  onTap: () {
                    // Navigate to meditation screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const GuidedMeditationScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
                // Journaling Card
                _buildFeatureCard(
                  title: 'Daily Journal',
                  subtitle: 'Write down your thoughts and feelings',
                  icon: Icons.note_alt_rounded,
                  color: const Color(0xFFFFE0B2), // Pastel yellow
                  onTap: () {
                    // Navigate to journal screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DailyJournalPage(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
                // Therapist Card
                _buildFeatureCard(
                  title: 'Talk to a Therapist',
                  subtitle: 'Reach out to someone who can help',
                  icon: Icons.chat_bubble_rounded,
                  color: const Color(0xFFFFCCBC), // Pastel orange
                  onTap: () {
                    // Navigate to therapist screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TherapistConnectScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 30, color: color),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Color(0xFF454545),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontFamily: 'Quicksand',
                      fontSize: 14,
                      color: Color(0xFF7A7A7A),
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
}
