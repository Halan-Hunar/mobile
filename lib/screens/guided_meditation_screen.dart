import 'package:flutter/material.dart';

class GuidedMeditationScreen extends StatelessWidget {
  const GuidedMeditationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.appBarTheme.backgroundColor ?? theme.primaryColor,
        title: const Text('Guided Meditation'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Explore Meditations',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Relax and focus with our guided meditation sessions.',
              style: theme.textTheme.bodyMedium,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  _buildMeditationCard(
                    title: 'Finding Calm',
                    subtitle: '10 min session',
                    color: const Color(0xFFC8E6C9), // Pastel green
                  ),
                  const SizedBox(height: 20),
                  _buildMeditationCard(
                    title: 'Spiritual Growth',
                    subtitle: '15 min session',
                    color: const Color(0xFFFFF9C4), // Pastel yellow
                  ),
                  const SizedBox(height: 20),
                  _buildMeditationCard(
                    title: 'Motivation Boost',
                    subtitle: '8 min session',
                    color: const Color(0xFFFFCCBC), // Pastel peach
                  ),
                  const SizedBox(height: 20),
                  _buildMeditationCard(
                    title: 'Inner Peace',
                    subtitle: '12 min session',
                    color: const Color(0xFFBBDEFB), // Pastel blue
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
  }) {
    return Container(
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
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.spa, size: 30, color: Colors.grey),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
