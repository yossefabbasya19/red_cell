import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:red_cell/views/on_boarding/on_boarding.dart';

abstract class MyRoutes {
  static const String onBoarding = '/onBoarding';

  static Route<dynamic>? myRoutes(RouteSettings settings) {
    switch (settings.name) {
      case onBoarding:
        return CupertinoPageRoute(builder: (context) => OnBoarding());
    }
    return null;
  }
}
