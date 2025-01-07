import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/accessibility_settings.dart';
import 'pages/login_page.dart'; // Import the LoginPage
import 'screens/home_page.dart'; // Import the HomePage (if needed later)

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
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            brightness: settings.darkMode ? Brightness.dark : Brightness.light,
            scaffoldBackgroundColor: settings.darkMode
                ? const Color(0xFF1E1E1E) // Lighter dark mode
                : const Color(0xFFFBEFF8), // Light pastel background
            textTheme: TextTheme(
              bodyMedium: TextStyle(fontSize: settings.fontSize),
            ),
          ),
          home: LoginPage(), // Set the LoginPage as the initial screen
        );
      },
    );
  }
}
