import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/helper/helper_functions.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({required this.titleName, super.key});
  final String titleName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15.w),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          titleName,
          style: HelperFunction.textTheme(context).titleLarge,
        ),
      ),
    );
  }
}
