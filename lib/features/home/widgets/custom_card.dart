import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/Themes/colors.dart';

class CustomCard extends StatelessWidget {
  const CustomCard(
      {required this.customWidth,
      required this.customHeight,
      required this.imageName,
      super.key});
  final String imageName;
  final double customWidth;
  final double customHeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Stack(
        children: [
          Container(
            height: customHeight,
            width: customWidth,
            child: Image.asset(
              imageName,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            top: 10,
            left: 5,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.7),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Row(
                children: [
                  Icon(Icons.star, color: ThemeColors.yellow, size: 16.sp),
                  SizedBox(width: 4.w),
                  Text(
                    "7.7",
                    style: Theme.of(context).textTheme.bodyMedium,
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
