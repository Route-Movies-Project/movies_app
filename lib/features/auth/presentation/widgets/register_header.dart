import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/helper/helper_functions.dart';
import 'package:movies_app/core/shared/widgets/avatar_images.dart';

class RegisterHeader extends StatefulWidget {
  const RegisterHeader({
    required this.onPageChanged,
    super.key,
  });
  final dynamic Function(int, CarouselPageChangedReason)? onPageChanged;
  @override
  State<RegisterHeader> createState() => _RegisterHeaderState();
}

class _RegisterHeaderState extends State<RegisterHeader> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: AvatarImages.avatarImages.length,
          itemBuilder: (context, index, realIndex) {
            return Image.asset(
              AvatarImages.avatarImages[index],
              fit: BoxFit.contain,
            );
          },
          options: CarouselOptions(
            height: 170.h,
            onPageChanged: widget.onPageChanged,
            enlargeCenterPage: true,
            viewportFraction: 0.35,
            enlargeFactor: 0.5,
            scrollDirection: Axis.horizontal,
          ),
        ),
        Text(
          "avatar".tr(),
          style: HelperFunction.textTheme(context).bodyMedium,
        ),
      ],
    );
  }
}
