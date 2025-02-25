import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/helper/helper_functions.dart';
import 'package:movies_app/shared/widgets/avatar_images.dart';

class RegisterHeader extends StatefulWidget {
  const RegisterHeader({super.key});

  @override
  State<RegisterHeader> createState() => _RegisterHeaderState();
}

class _RegisterHeaderState extends State<RegisterHeader> {
  int selectedAvatarIndex = 0;

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
            onPageChanged: (index, reason) {
              setState(() {
                selectedAvatarIndex = index;
              });
              print(selectedAvatarIndex);
            },
            enlargeCenterPage: true,
            viewportFraction: 0.35,
            enlargeFactor: 0.5,
            scrollDirection: Axis.horizontal,
          ),
        ),
        Text(
          "Avatar",
          style: HelperFunction.textTheme(context).bodyMedium,
        ),
      ],
    );
  }
}
