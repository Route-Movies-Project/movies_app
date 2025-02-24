import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/introduction/widgets/intro_widget.dart';
import 'package:movies_app/widgets/custom_decoration_image.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});
  static const routeName = "/intro";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomDecorationImage(
        imageName: "assets/images/movieposter.png",
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 33.h),
          child: const IntroWidget(),
        ),
      ),
    );
  }
}
