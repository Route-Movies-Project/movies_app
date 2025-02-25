import 'package:flutter/material.dart';
import 'package:movies_app/auth/presentation/views/forget_pass_screen.dart';
import 'package:movies_app/auth/presentation/views/login.dart';
import 'package:movies_app/auth/presentation/views/register.dart';
import 'package:movies_app/introduction/view/intro_screen.dart';
import 'package:movies_app/onboarding/view/onboarding_screen.dart';
import 'package:movies_app/auth/presentation/widgets/register_body.dart';
import 'package:movies_app/update-profile/view/update_profile.dart';

class AppRoutes {
  static final Map<String, Widget Function(BuildContext)> routes = {
    IntroScreen.routeName: (_) => const IntroScreen(),
    UpdateProfile.routeName: (_) => const UpdateProfile(),
    OnBoarding.routeName: (_) => const OnBoarding(),
    ForgetPassScreen.routeName: (_) => ForgetPassScreen(),
    Register.routeName: (_) => const Register(),

    LoginScreen.routeName: (_) => const LoginScreen(),
  };
  static final String? initialRoute = Register.routeName;
}
