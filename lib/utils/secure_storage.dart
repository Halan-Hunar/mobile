import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final storage = FlutterSecureStorage();

// Save data securely
Future<void> saveUserData(String key, String value) async {
  await storage.write(key: key, value: value);
}

// Retrieve data securely
Future<String?> getUserData(String key) async {
  return await storage.read(key: key);
}
