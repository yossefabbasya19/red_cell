import 'package:red_cell/core/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SharePreference {
  static void setOnBoardingStates(bool state) async {
    SharedPreferences preference =  await SharedPreferences.getInstance();
    preference.setBool(kSharedPreferenceBoardingState,state);
  }
  static Future<bool> getOnBoardingStates() async {
    SharedPreferences preference =  await SharedPreferences.getInstance();
    return preference.getBool(kSharedPreferenceBoardingState)??false;
  }
}
