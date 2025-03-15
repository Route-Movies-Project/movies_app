import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/Themes/colors.dart';
import 'package:movies_app/core/utils/helper/helper_functions.dart';

class CustomTabItem extends StatelessWidget {
  const CustomTabItem(
      {required this.isSelected, required this.genre, super.key});
  final String genre;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.h,
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xffF6BD00) : Colors.transparent,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          width: 2.sp,
          color: isSelected ? Colors.transparent : const Color(0xffF6BD00),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.sp),
        child: Text(
          genre,
          style: HelperFunction.textTheme(context).titleLarge!.copyWith(
                color: isSelected ? ThemeColors.black : const Color(0xffF6BD00),
                fontSize: 24.sp,
              ),
        ),
      ),
    );
  }
}
