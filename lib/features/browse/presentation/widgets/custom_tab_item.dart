import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/Themes/colors.dart';
import 'package:movies_app/core/utils/helper/helper_functions.dart';

class CustomTabItem extends StatelessWidget {
  const CustomTabItem({required this.genre, super.key});
  final String genre;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.h,
      decoration: BoxDecoration(
        color: const Color(0xffF6BD00),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.sp),
        child: Text(
          genre,
          style: HelperFunction.textTheme(context).titleLarge!.copyWith(
                color: ThemeColors.black,
                fontSize: 24.sp,
              ),
        ),
      ),
    );
  }
}
