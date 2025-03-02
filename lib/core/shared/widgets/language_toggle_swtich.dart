import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_app/core/Themes/colors.dart';

class LanguageToggleSwtich extends StatelessWidget {
  const LanguageToggleSwtich({
    required this.languageValue,
    required this.onChanged,
    super.key,
  });
  final int languageValue;
  final Function(int)? onChanged;
  @override
  Widget build(BuildContext context) {
    return AnimatedToggleSwitch<int>.rolling(
      current: languageValue,
      borderWidth: 2,
      spacing: 10.w,
      values: const [0, 1],
      onChanged: onChanged,
      iconBuilder: (value, foreground) => value == 0
          ? SvgPicture.asset(
              'assets/icons/usa.svg',
              width: 35.w,
              height: 35.h,
              fit: BoxFit.cover,
            )
          : SvgPicture.asset(
              'assets/icons/egypt.svg',
              width: 35.w,
              height: 35.h,
              fit: BoxFit.cover,
            ),
      iconsTappable: true,
      style: ToggleStyle(
        borderColor: ThemeColors.yellow,
        indicatorColor: ThemeColors.yellow,
        backgroundColor: Colors.transparent,
        borderRadius: BorderRadius.circular(30.r),
      ),
    );
  }
}
