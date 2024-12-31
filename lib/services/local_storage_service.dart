import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  Future<void> saveEvent(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  Future<String?> getEvent(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }
}
