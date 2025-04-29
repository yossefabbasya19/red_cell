import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'package:red_cell/core/provider/config_provider/config_provider.dart';
import 'package:red_cell/views/authentication/login/cubit/log_in/log_in_cubit.dart';
import 'package:red_cell/views/request_details/cubit/add_donation_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:red_cell/config/theme/my_theme.dart';
import 'package:red_cell/core/my_routes/my_routes.dart';
import 'package:red_cell/core/share_pref/share_preference.dart';
import 'package:red_cell/views/authentication/login/login.dart';
import 'package:red_cell/views/main_layout/main_layout.dart';
import 'package:red_cell/views/on_boarding/on_boarding.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RedCell extends StatefulWidget {
  const RedCell({super.key});

  @override
  State<RedCell> createState() => _RedCellState();
}

class _RedCellState extends State<RedCell> {
  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    ConfigProvider config = Provider.of<ConfigProvider>(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AddDonationCubit()),
        BlocProvider(create: (context) => LogInCubit()),
      ],
      child: FutureBuilder(
        future: Provider.of<ConfigProvider>(context).getValue(),
        builder: (context, snapShot) {
          if (snapShot.hasData) {
            return MaterialApp(
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              locale: Locale(snapShot.data! ? "ar" : 'en'),
              debugShowCheckedModeBanner: false,
              theme: MyTheme.light,
              darkTheme: MyTheme.dark,
              themeMode: ThemeMode.light,
              routes: MyRoutes.routes,
              //onGenerateRoute: MyRoutes.myRoutes,
              home: FutureBuilder(
                future: SharePreference.getOnBoardingStates(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.data!) {
                      //return MainLayout();
                      return FirebaseAuth.instance.currentUser == null
                          ? Login()
                          : MainLayout();
                    } else {
                      return OnBoarding();
                    }
                  }
                  return CircularProgressIndicator();
                },
              ),
            );
          } else {
            return Scaffold(body: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
