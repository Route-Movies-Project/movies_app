import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/Themes/colors.dart';
import 'package:movies_app/core/utils/helper/helper_functions.dart';
import 'package:shimmer/shimmer.dart';

class LoadingGenreWidget extends StatelessWidget {
  const LoadingGenreWidget({required this.mygenre, super.key});
  final String mygenre;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Shimmer.fromColors(
                baseColor: const Color(0xFF282A28),
                highlightColor: Colors.grey.shade500,
                child: Text(
                  mygenre,
                  style: HelperFunction.textTheme(context)
                      .bodyMedium!
                      .copyWith(fontSize: 20.sp),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    Shimmer.fromColors(
                      baseColor: const Color(0xFF282A28),
                      highlightColor: Colors.grey.shade500,
                      child: Text(
                        "See More",
                        style: HelperFunction.textTheme(context)
                            .bodyMedium!
                            .copyWith(color: ThemeColors.yellow),
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Shimmer.fromColors(
                      baseColor: const Color(0xFF282A28),
                      highlightColor: Colors.grey.shade500,
                      child: Icon(
                        Icons.arrow_forward,
                        size: 14.sp,
                        color: ThemeColors.yellow,
                      ),
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
            height: 220.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Shimmer.fromColors(
                    baseColor: const Color(0xFF282A28),
                    highlightColor: Colors.grey.shade500,
                    child: Container(
                      width: 146.w,
                      height: 220.h,
                      decoration: BoxDecoration(
                        color: const Color(0xFF282A28),
                        borderRadius: BorderRadius.circular(
                          20.r,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
