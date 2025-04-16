import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:red_cell/config/theme/my_theme.dart';
import 'package:red_cell/core/my_routes/my_routes.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
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
    FlutterNativeSplash.remove();
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyTheme.light,
      darkTheme: MyTheme.dark,
      onGenerateRoute: MyRoutes.myRoutes,
      initialRoute: MyRoutes.onBoarding,
    );
  }
}
