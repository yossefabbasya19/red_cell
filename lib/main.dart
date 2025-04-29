import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'package:red_cell/bloc_observer.dart';
import 'package:red_cell/core/provider/config_provider/config_provider.dart';
import 'package:red_cell/firebase_options.dart';
import 'package:red_cell/red_cell.dart';


void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Bloc.observer = MyBlocObserver();
  runApp(ChangeNotifierProvider(
    create: (context) => ConfigProvider(),
    child: RedCell(),
  ));
}

