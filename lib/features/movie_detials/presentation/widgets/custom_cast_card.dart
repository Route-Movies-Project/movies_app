import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/Themes/colors.dart';
import 'package:movies_app/core/utils/helper/helper_functions.dart';

class CustomCastCard extends StatelessWidget {
  const CustomCastCard(
      {required this.imageName,
      required this.actorName,
      required this.characterName,
      super.key});
  final String imageName;
  final String actorName;
  final String characterName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Container(
        width: double.infinity,
        height: 100.h,
        decoration: BoxDecoration(
          color: ThemeColors.grey,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(11.sp),
              child: Image.asset(imageName),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: 10.w, top: 16.h, right: 16.w, bottom: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Name : $actorName',
                    style: HelperFunction.textTheme(context)
                        .bodyMedium!
                        .copyWith(fontSize: 20.sp),
                  ),
                  const Spacer(),
                  Text(
                    'Character : $characterName',
                    style: HelperFunction.textTheme(context)
                        .bodyMedium!
                        .copyWith(fontSize: 20.sp),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
