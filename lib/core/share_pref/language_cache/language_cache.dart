import 'package:shared_preferences/shared_preferences.dart';

class LanguageCache {
  Future<bool?>  getLanguageCache() async {
    String languageKey = "language_value";
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(languageKey);
  }
  void setLanguageCache (bool value)async {
    String languageKey = "language_value";
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
     sharedPreferences.setBool(languageKey,value);
  }
}