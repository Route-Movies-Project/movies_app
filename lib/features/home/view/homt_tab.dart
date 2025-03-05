import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/Themes/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:movies_app/core/utils/helper/helper_functions.dart';
import 'package:movies_app/features/home/widgets/custom_card.dart';

class HomeTab extends StatefulWidget {
  static const String routeName = 'home_tab';
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomtTabState();
}

class _HomtTabState extends State<HomeTab> {
  List<String> images = [
    "assets/images/Black_Widow.png",
    "assets/images/Captain_America.png",
    "assets/images/Batman.png"
  ];

  @override
  Widget build(BuildContext context) {
    int currentphoto = 0;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Stack(
                    children: [
                      Image.asset(
                        images[currentphoto],
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 645.h,
                      ),
                      Container(
                        width: double.infinity,
                        height: 645.h,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              ThemeColors.black.withValues(alpha: 0.8),
                              ThemeColors.black.withValues(alpha: 0.6),
                              ThemeColors.black,
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset("assets/images/Available Now.png"),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: CarouselSlider.builder(
                          options: CarouselOptions(
                            scrollDirection: Axis.horizontal,
                            enlargeCenterPage: true,
                            enlargeStrategy: CenterPageEnlargeStrategy.height,
                            enlargeFactor: 0.4,
                            viewportFraction: 0.6,
                            height: 350.h,
                          ),
                          itemCount: 3,
                          itemBuilder: (BuildContext context, int index, _) {
                            return CustomCard(
                              customWidth: 235.w,
                              customHeight: 350.h,
                              imageName: images[index],
                            );
                          },
                        ),
                      ),
                      Image.asset("assets/images/Watch Now.png"),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Action",
                      style: HelperFunction.textTheme(context)
                          .bodyMedium!
                          .copyWith(fontSize: 20.sp),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Row(
                        children: [
                          Text(
                            "See More",
                            style: HelperFunction.textTheme(context)
                                .bodyMedium!
                                .copyWith(color: ThemeColors.yellow),
                          ),
                          SizedBox(width: 4.w),
                          Icon(
                            Icons.arrow_forward,
                            size: 14.sp,
                            color: ThemeColors.yellow,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 12.h),
              Padding(
                padding: EdgeInsets.only(bottom: 120.h),
                child: SizedBox(
                  height: 200.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return CustomCard(
                        customWidth: 146.w,
                        customHeight: 220.h,
                        imageName: images[index],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
