import 'package:red_cell/core/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharePreference {
  static SharePreference? instance;

  SharePreference._();

  factory SharePreference() {
    instance ??= SharePreference._();
    return instance!;
  }

  static SharedPreferences? preference;

  Future<void> init() async {
    preference = await SharedPreferences.getInstance();
  }

  static void setOnBoardingStates(bool state) async {
    await preference!.setBool(kSharedPreferenceBoardingState, state);
  }

  static Future<bool> getOnBoardingStates() async {
    return preference!.getBool(kSharedPreferenceBoardingState) ?? false;
  }
}
