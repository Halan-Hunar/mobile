import 'package:flutter/material.dart';

class AccessibilitySettings extends ChangeNotifier {
  double _fontSize = 16.0;
  bool _highContrast = false;
  bool _darkMode = false;

  double get fontSize => _fontSize;
  bool get highContrast => _highContrast;
  bool get darkMode => _darkMode;

  void setFontSize(double value) {
    _fontSize = value;
    notifyListeners();
  }

  void toggleHighContrast(bool value) {
    _highContrast = value;
    notifyListeners();
  }

  void toggleDarkMode(bool value) {
    _darkMode = value;
    notifyListeners();
  }
}
