import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/Themes/colors.dart';
import 'package:movies_app/core/utils/helper/helper_functions.dart';
import 'package:movies_app/features/onboarding/view/onboarding_screen.dart';
import 'package:movies_app/core/shared/widgets/custom_elevated_button.dart';

class IntroWidget extends StatelessWidget {
  const IntroWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "Find Your Next Favorite Movie Here",
          style: HelperFunction.textTheme(context).bodyLarge,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 16.h,
        ),
        Text(
          "Get access to a huge library of movies to suit all tastes. You will surely like it.",
          style: HelperFunction.textTheme(context).bodyLarge!.copyWith(
                fontSize: 20.sp,
                fontWeight: FontWeight.w400,
                color: const Color.fromRGBO(255, 255, 255, 0.6),
              ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 16.h,
        ),
        CustomElevatedButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, OnBoarding.routeName);
          },
          child: Text(
            "Explore",
            style: HelperFunction.textTheme(context).bodyLarge!.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: ThemeColors.black,
                ),
          ),
        ),
      ],
    );
  }
}
