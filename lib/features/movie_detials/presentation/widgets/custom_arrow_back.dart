import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/Themes/colors.dart';

class CustomArrowBack extends StatelessWidget {
  const CustomArrowBack({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 37.w,
      height: 58.h,
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        color: ThemeColors.white,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
