import 'package:flutter/material.dart';
import 'package:red_cell/views/authentication/login/login.dart';
import 'package:red_cell/views/authentication/signup/signin_second_screen.dart';
import 'package:red_cell/views/authentication/signup/signup_first_screen.dart';
import 'package:red_cell/views/main_layout/main_layout.dart';
import 'package:red_cell/views/on_boarding/on_boarding.dart';

abstract class MyRoutes {
  static const String onBoarding = '/onBoarding';
  static const String login = '/login';
  static const String signupFirstScreen = '/signupFirst';
  static const String signupSecondScreen = '/signupSecond';
  static const String mainLayout = '/mainLayout';

  static Map<String , WidgetBuilder> routes = {
    onBoarding : (_)=>OnBoarding(),
    login : (_)=>Login(),
    signupFirstScreen : (_)=>Signup(),
    signupSecondScreen : (_)=>SignInSecondScreen(),
    mainLayout : (_)=>MainLayout(),
  };
}
