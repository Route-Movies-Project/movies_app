import 'package:flutter/material.dart';
import 'package:movies_app/auth/presentation/views/forget_pass_screen.dart';
import 'package:movies_app/introduction/view/intro_screen.dart';
import 'package:movies_app/onboarding/view/onboarding_screen.dart';
import 'package:movies_app/register/register_body.dart';
import 'package:movies_app/update-profile/view/update_profile.dart';

class AppRoutes {
  static final Map<String, Widget Function(BuildContext)> routes = {
    IntroScreen.routeName: (_) => const IntroScreen(),
    UpdateProfile.routeName: (_) => const UpdateProfile(),
    OnBoarding.routeName: (_) => const OnBoarding(),
    ForgetPassScreen.routeName: (_) => ForgetPassScreen(),
    RegisterBody.routeName: (_) => const RegisterBody(),
  };
  static final String? initialRoute = RegisterBody.routeName;

}
