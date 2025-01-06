import 'package:flutter/material.dart';
import 'daily_journal.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

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
      appBar: AppBar(
        title: const Text('Mental Health App'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.note),
            label: 'Journal',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.self_improvement),
            label: 'Meditation',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Therapist',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor:
            Colors.grey, // Add a clear color for unselected items
        showUnselectedLabels: true, // Ensure unselected labels are shown
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome to your Mental Health App!',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Here are some tools to help you manage your mental health:',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

class GuidedMeditationScreen extends StatelessWidget {
  const GuidedMeditationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Guided Meditation Coming Soon!'),
    );
  }
}

class TherapistConnectScreen extends StatelessWidget {
  const TherapistConnectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Connect with a Therapist Coming Soon!'),
    );
  }
}
