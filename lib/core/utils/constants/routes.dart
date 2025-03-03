import 'package:flutter/material.dart';
import 'package:movies_app/features/auth/presentation/views/forget_pass_screen.dart';
import 'package:movies_app/features/auth/presentation/views/login.dart';
import 'package:movies_app/features/auth/presentation/views/register.dart';
import 'package:movies_app/features/home/homt_tab.dart';
import 'package:movies_app/features/introduction/view/intro_screen.dart';
import 'package:movies_app/features/onboarding/view/onboarding_screen.dart';
import 'package:movies_app/features/profile/presentation/view/profile.dart';
import 'package:movies_app/features/profile/presentation/view/update_profile.dart';

class AppRoutes {
  static final Map<String, Widget Function(BuildContext)> routes = {
    IntroScreen.routeName: (_) => const IntroScreen(),
    UpdateProfile.routeName: (_) => const UpdateProfile(),
    OnBoarding.routeName: (_) => const OnBoarding(),
    ForgetPassScreen.routeName: (_) => ForgetPassScreen(),
    Register.routeName: (_) => const Register(),
    LoginScreen.routeName: (_) => const LoginScreen(),
    HometTab.routeName: (_) => const HometTab(),
    Profile.routeName: (_) => const Profile(),
  };

  static final String initialRoute = IntroScreen.routeName;
}
