import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:red_cell/core/di/di.dart';
import 'package:red_cell/views/account_managment/presentation/view_model/edit_profile_cubit.dart';
import 'package:red_cell/views/account_managment/presentation/views/edit_profile.dart';
import 'package:red_cell/views/account_managment/data/repo/edit_profile_repo_imple.dart';
import 'package:red_cell/views/authentication/presentation/views/login/login.dart';
import 'package:red_cell/views/authentication/presentation/views/signup/signup_second_screen.dart';
import 'package:red_cell/views/authentication/presentation/views/signup/signup_first_screen.dart';
import 'package:red_cell/views/chat/presentation/views/chat.dart';
import 'package:red_cell/views/chat/presentation/view_model/chat_cubit.dart';
import 'package:red_cell/views/donation_details/presentation/veiws/donation_details.dart';
import 'package:red_cell/views/donation_details/presentation/view_model/dontation_details_cubit.dart';
import 'package:red_cell/views/forget_password/forget_password.dart';
import 'package:red_cell/views/main_layout/main_layout.dart';
import 'package:red_cell/views/donation_details/presentation/veiws/widgets/receiver_location.dart';
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
  static const String forgetPassword = '/forgetPassword';
  static const String chat = '/chat';

  static Map<String, WidgetBuilder> routes = {
    chat: (_) =>
        BlocProvider(
          create: (context) => ChatCubit(),
          child: Chat(),
        ),
    onBoarding: (_) => OnBoarding(),
    login: (_) => Login(),
    signupFirstScreen: (_) => Signup(),
    signupSecondScreen: (_) => SignInSecondScreen(),
    mainLayout: (_) => MainLayout(),
    donationDetails: (_) =>
        BlocProvider(
          create: (context) => getIt<DonationDetailsCubit>(),
          child: DonationDetails(),
        ),
    mapLocation: (_) => MapLocation(),
    requestDetails: (_) => RequestDetails(),
    requestLocation: (_) => RequestLocation(),
    myDonation: (_) => MyDonations(),
    editProfile: (_) =>
        BlocProvider(
          create: (context) => getIt<EditProfileCubit>(),
          child: EditProfile(),
        ),
    myRequests: (_) => MyRequests(),
    forgetPassword: (_) => ForgetPassword()
  };
}
