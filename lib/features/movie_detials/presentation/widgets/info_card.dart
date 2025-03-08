import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/Themes/colors.dart';
import 'package:movies_app/core/utils/helper/helper_functions.dart';

class info_card extends StatelessWidget {
  final String text;
  final IconData icon;
  const info_card({
    super.key,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 47.h,
      width: 122.w,
      decoration: BoxDecoration(
        color: ThemeColors.grey,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            icon,
            size: 35.sp,
            color: ThemeColors.yellow,
          ),
          Text(
            text,
            style: HelperFunction.textTheme(context).titleLarge,
          ),
        ],
      ),
    );
  }
}
