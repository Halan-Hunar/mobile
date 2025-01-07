import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/accessibility_settings.dart';
import 'pages/login_page.dart'; // Import the LoginPage

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
          debugShowCheckedModeBanner: false, // Remove debug banner
          theme: ThemeData(
            brightness: settings.darkMode ? Brightness.dark : Brightness.light,
            textTheme: TextTheme(
              bodyMedium: TextStyle(fontSize: settings.fontSize),
            ),
            primaryColor: settings.highContrast ? Colors.black : Colors.blue,
          ),
          home: LoginPage(), // Start with LoginPage
        );
      },
    );
  }
}
