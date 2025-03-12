import 'package:flutter/material.dart';
import 'package:movies_app/features/movie_detials/presentation/views/movie_details_screen.dart';
import 'package:movies_app/features/profile/presentation/view/reset_pass_screen.dart';
import 'package:movies_app/features/auth/presentation/views/login.dart';
import 'package:movies_app/features/auth/presentation/views/register.dart';
import 'package:movies_app/features/introduction/view/intro_screen.dart';
import 'package:movies_app/features/onboarding/view/onboarding_screen.dart';
import 'package:movies_app/features/profile/presentation/view/profile.dart';
import 'package:movies_app/features/profile/presentation/view/update_profile.dart';
import 'package:movies_app/home_screen.dart';

class AppRoutes {
  static final Map<String, Widget Function(BuildContext)> routes = {
    IntroScreen.routeName: (_) => const IntroScreen(),
    UpdateProfile.routeName: (_) => const UpdateProfile(),
    OnBoarding.routeName: (_) => const OnBoarding(),
    ResetPassScreen.routeName: (_) => const ResetPassScreen(),
    Register.routeName: (_) => const Register(),
    LoginScreen.routeName: (_) => const LoginScreen(),
    HomeScreen.routeName: (_) => const HomeScreen(),
    Profile.routeName: (_) => const Profile(),
    MovieDetailsScreen.routeName: (_) => MovieDetailsScreen(),
  };

  static final String initialRoute = IntroScreen.routeName;
}
