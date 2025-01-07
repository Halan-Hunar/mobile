import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/accessibility_settings.dart';
import 'pages/settings.dart';
import 'pages/home_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AccessibilitySettings(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AccessibilitySettings>(
      builder: (context, settings, child) {
        return MaterialApp(
          theme: ThemeData(
            brightness: settings.darkMode ? Brightness.dark : Brightness.light,
            textTheme: TextTheme(
              bodyMedium: TextStyle(fontSize: settings.fontSize),
            ),
            primaryColor: settings.highContrast ? Colors.black : Colors.blue,
          ),
          home: const HomePage(),
        );
      },
    );
  }
}
