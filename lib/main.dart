import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:red_cell/bloc_observer.dart';
import 'package:red_cell/config/theme/my_theme.dart';
import 'package:red_cell/core/my_routes/my_routes.dart';
import 'package:red_cell/core/share_pref/share_preference.dart';
import 'package:red_cell/firebase_options.dart';
import 'package:red_cell/views/authentication/login/cubit/log_in/log_in_cubit.dart';
import 'package:red_cell/views/authentication/login/login.dart';
import 'package:red_cell/views/on_boarding/on_boarding.dart';
import 'package:red_cell/views/request_details/cubit/add_donation_cubit.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = MyBlocObserver();
  runApp(RedCell());
}

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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AddDonationCubit(),),
        BlocProvider(create: (context) => LogInCubit(),),
      ],
      //create: (context) => AddDonationCubit(),
      child: MaterialApp(
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
                return Login();
              } else {
                return OnBoarding();
              }
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
