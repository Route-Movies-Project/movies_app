import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/Themes/colors.dart';
import 'package:movies_app/core/utils/helper/helper_functions.dart';

class CustomGenreCard extends StatelessWidget {
  const CustomGenreCard({required this.genreName, super.key});
  final String genreName;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ThemeColors.grey,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Center(
        child: Text(
          genreName,
          style: HelperFunction.textTheme(context).bodyMedium,
        ),
      ),
    );
  }
}
