import 'package:shared_preferences/shared_preferences.dart';

class LanguageCache {
  LanguageCache._();

  static LanguageCache instance = LanguageCache._();

  factory LanguageCache() {
    return instance;
  }

  late SharedPreferences sharedPreferences;

  Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  bool getLanguageCache() {
    String languageKey = "language_value";
    return sharedPreferences.getBool(languageKey) ?? false;
  }

   Future<void> setLanguageCache(bool value) async {
    String languageKey = "language_value";
    await sharedPreferences.setBool(languageKey, value);
  }
}
