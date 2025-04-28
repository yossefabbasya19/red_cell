import 'package:flutter/material.dart';
import 'package:red_cell/views/account_managment/edit_profile.dart';
import 'package:red_cell/views/authentication/login/login.dart';
import 'package:red_cell/views/authentication/signup/signin_second_screen.dart';
import 'package:red_cell/views/authentication/signup/signup_first_screen.dart';
import 'package:red_cell/views/donation_details/donation_details.dart';
import 'package:red_cell/views/main_layout/main_layout.dart';
import 'package:red_cell/views/donation_details/widgets/receiver_location.dart';
import 'package:red_cell/views/main_layout/tabs/my_donations/my_donations%20.dart';
import 'package:red_cell/views/my_requests/my_requests.dart';
import 'package:red_cell/views/on_boarding/on_boarding.dart';
import 'package:red_cell/views/request_details/request_details.dart';
import 'package:red_cell/views/request_details/widgets/request_location.dart';

abstract class MyRoutes {
  static const String onBoarding = '/onBoarding';
  static const String login = '/login';
  static const String signupFirstScreen = '/signupFirst';
  static const String signupSecondScreen = '/signupSecond';
  static const String mainLayout = '/mainLayout';
  static const String donationDetails = '/donationDetails';
  static const String mapLocation = '/mapLocation';
  static const String requestDetails = '/requestDetails';
  static const String requestLocation = '/requestLocation';
  static const String myDonation = '/myDonation';
  static const String editProfile = '/editProfile';
  static const String myRequests = '/myRequests';

  static Map<String , WidgetBuilder> routes = {
    onBoarding : (_)=>OnBoarding(),
    login : (_)=>Login(),
    signupFirstScreen : (_)=>Signup(),
    signupSecondScreen : (_)=>SignInSecondScreen(),
    mainLayout : (_)=>MainLayout(),
    donationDetails : (_)=>DonationDetails(),
    mapLocation : (_)=>MapLocation(),
    requestDetails : (_)=>RequestDetails(),
    requestLocation : (_)=>RequestLocation(),
    myDonation : (_)=>MyDonations(),
    editProfile : (_)=>EditProfile(),
    myRequests : (_)=>MyRequests()
  };
}
