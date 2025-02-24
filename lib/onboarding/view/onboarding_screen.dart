import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/Themes/colors.dart';
import 'package:movies_app/core/utils/helper/helper_functions.dart';
import 'package:movies_app/onboarding/widgets/custom_outlined_button.dart';
import 'package:movies_app/onboarding/widgets/onbaording_texts.dart';
import 'package:movies_app/widgets/custom_decoration_image.dart';
import 'package:movies_app/widgets/custom_elevated_button.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});
  static const routeName = '/onboarding-screen';

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final PageController pageController = PageController();
  int currentIndex = 0;
  bool isLastPage = false;

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // PageView - Background Images
          PageView.builder(
            controller: pageController,
            scrollDirection: Axis.horizontal,
            itemCount: OnbaordingTexts.title.length,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
                isLastPage = index == OnbaordingTexts.title.length - 1;
              });
            },
            itemBuilder: (context, index) {
              return CustomDecorationImage(
                imageName: "assets/onboarding/${currentIndex + 1}.png",
              );
            },
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              padding: EdgeInsetsDirectional.only(
                start: 16.w,
                end: 16.w,
                top: 34.h,
                bottom: 16.h,
              ),
              decoration: BoxDecoration(
                color: ThemeColors.black,
                borderRadius: BorderRadius.vertical(top: Radius.circular(40.r)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    OnbaordingTexts.title[currentIndex],
                    style:
                        HelperFunction.textTheme(context).bodyLarge!.copyWith(
                              fontWeight: FontWeight.w700,
                              fontSize: 24.sp,
                            ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    OnbaordingTexts.subTitle[currentIndex],
                    style:
                        HelperFunction.textTheme(context).bodyLarge!.copyWith(
                              fontWeight: FontWeight.w400,
                              fontSize: 20.sp,
                            ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 24.h),
                  CustomElevatedButton(
                    onPressed: () {
                      pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Text(
                      !isLastPage ? "Next" : "Finish",
                      style:
                          HelperFunction.textTheme(context).bodyLarge!.copyWith(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: ThemeColors.black,
                              ),
                    ),
                  ),
                  if (currentIndex != 0) SizedBox(height: 16.h),
                  if (currentIndex != 0)
                    CustomOutlinedButton(
                      onPressed: () {
                        pageController.previousPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      },
                      child: const Text("Back"),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
