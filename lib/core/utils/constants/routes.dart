import 'package:flutter/material.dart';
import 'package:movies_app/introduction/view/intro_screen.dart';
import 'package:movies_app/update-profile/view/update_profile.dart';

class AppRoutes {
  static final Map<String, Widget Function(BuildContext)> routes = {
    IntroScreen.routeName: (_) => const IntroScreen(),
    UpdateProfile.routeName: (_) => const UpdateProfile(),
  };
  static final String? initialRoute = UpdateProfile.routeName;
}
