import 'package:flutter/cupertino.dart';
import 'package:red_cell/core/share_pref/language_cache/language_cache.dart';
class ConfigProvider extends ChangeNotifier{
  late bool isArabic ;
  Future<bool> getValue()async{
    isArabic =  await LanguageCache().getLanguageCache()??false;
    return isArabic;
  }
  void configSetting(bool switchTo){

    if(isArabic == switchTo)return;
    LanguageCache().setLanguageCache(switchTo);
    isArabic = switchTo;
    notifyListeners();
  }
}