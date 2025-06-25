import 'package:flutter/cupertino.dart';
import 'package:red_cell/core/share_pref/language_cache/language_cache.dart';
class ConfigProvider extends ChangeNotifier{
  late bool isArabic = LanguageCache().getLanguageCache();

  void configSetting(bool switchTo)async{
    if(isArabic == switchTo)return;
    await LanguageCache().setLanguageCache(switchTo);
    isArabic = switchTo;
    notifyListeners();
  }
}