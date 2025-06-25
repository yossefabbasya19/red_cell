import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'package:red_cell/bloc_observer.dart';
import 'package:red_cell/core/provider/config_provider/config_provider.dart';
import 'package:red_cell/core/share_pref/language_cache/language_cache.dart';
import 'package:red_cell/core/share_pref/share_preference.dart';
import 'package:red_cell/firebase_options.dart';
import 'package:red_cell/red_cell.dart';

const apiKey = "AIzaSyAWKu_Twvg7eNwg3I-RhwkA9xrvvYbPBV8";

void main() async {
  Gemini.init(apiKey: apiKey);
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Bloc.observer = MyBlocObserver();
  await LanguageCache().init();
  await SharePreference().init();

  runApp(
    ChangeNotifierProvider(
      create: (context) => ConfigProvider(),
      child: RedCell(),
    ),
  );
}
