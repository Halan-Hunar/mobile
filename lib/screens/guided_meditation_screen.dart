import 'package:flutter/material.dart';

class GuidedMeditationScreen extends StatelessWidget {
  const GuidedMeditationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBEFF8), // Pastel background
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5A8C4), // Pastel pink
        title: const Text(
          'Guided Meditation',
          style: TextStyle(
            fontFamily: 'Quicksand',
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Explore Meditations',
              style: TextStyle(
                fontFamily: 'Quicksand',
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Color(0xFF454545),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Relax and focus with our guided meditation sessions.',
              style: TextStyle(
                fontFamily: 'Quicksand',
                fontSize: 16,
                color: Color(0xFF7A7A7A),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  _buildMeditationCard(
                    title: 'Finding Calm',
                    subtitle: '10 min session',
                    color: const Color(0xFFC8E6C9), // Pastel green
                    icon: Icons.spa,
                    onTap: () {
                      // Action for Finding Calm
                    },
                  ),
                  const SizedBox(height: 20),
                  _buildMeditationCard(
                    title: 'Spiritual Growth',
                    subtitle: '15 min session',
                    color: const Color(0xFFFFE0B2), // Pastel yellow
                    icon: Icons.self_improvement,
                    onTap: () {
                      // Action for Spiritual Growth
                    },
                  ),
                  const SizedBox(height: 20),
                  _buildMeditationCard(
                    title: 'Motivation Boost',
                    subtitle: '8 min session',
                    color: const Color(0xFFFFCCBC), // Pastel orange
                    icon: Icons.emoji_objects,
                    onTap: () {
                      // Action for Motivation Boost
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMeditationCard({
    required String title,
    required String subtitle,
    required Color color,
    required IconData icon,
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
