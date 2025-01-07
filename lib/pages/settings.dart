import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'accessibility_settings.dart';

class AccessibilitySettingsPage extends StatefulWidget {
  const AccessibilitySettingsPage({Key? key}) : super(key: key);

  @override
  _AccessibilitySettingsPageState createState() => _AccessibilitySettingsPageState();
}

class _AccessibilitySettingsPageState extends State<AccessibilitySettingsPage> {
  @override
  Widget build(BuildContext context) {
    final settings = Provider.of<AccessibilitySettings>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Accessibility Settings')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Font Size'),
            Slider(
              value: settings.fontSize,
              min: 12.0,
              max: 24.0,
              divisions: 6,
              label: settings.fontSize.toString(),
              onChanged: (value) {
                settings.setFontSize(value);
              },
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('High Contrast'),
                Switch(
                  value: settings.highContrast,
                  onChanged: (value) {
                    settings.toggleHighContrast(value);
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Dark Mode'),
                Switch(
                  value: settings.darkMode,
                  onChanged: (value) {
                    settings.toggleDarkMode(value);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
