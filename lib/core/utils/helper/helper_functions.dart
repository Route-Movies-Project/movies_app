import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HelperFunction {
  static Image imageAssets(
    String name, {
    double? width,
    double? height,
    BoxFit fit = BoxFit.cover,
  }) {
    return Image.asset("assets/images/$name.png");
  }

  static SvgPicture svgAssets(
    String name, {
    double? width,
    double? height,
    required BoxFit fit,
  }) {
    return SvgPicture.asset(
      "assets/icons/$name.svg",
      fit: fit,
    );
  }

  static TextTheme textTheme(BuildContext context) {
    return Theme.of(context).textTheme;
  }
}
