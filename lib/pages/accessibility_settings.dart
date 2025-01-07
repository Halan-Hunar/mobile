import 'package:flutter/material.dart';

class AccessibilitySettings extends ChangeNotifier {
  double _fontSize = 16.0;
  bool _darkMode = false;
  bool _highContrast = false; // Add this property

  double get fontSize => _fontSize;
  bool get darkMode => _darkMode;
  bool get highContrast => _highContrast; // Add this getter

  void setFontSize(double value) {
    _fontSize = value;
    notifyListeners();
  }

  void toggleDarkMode(bool value) {
    _darkMode = value;
    notifyListeners();
  }

  void toggleHighContrast(bool value) { // Add this method
    _highContrast = value;
    notifyListeners();
  }
}
