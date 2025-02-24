import 'package:flutter/material.dart';
import 'package:movies_app/introduction/view/intro_screen.dart';

class AppRoutes {
  static final Map<String, Widget Function(BuildContext)> routes = {
    IntroScreen.routeName: (_) => const IntroScreen(),
  };
  static final String? initialRoute = IntroScreen.routeName;
}
