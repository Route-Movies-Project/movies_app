import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/Themes/colors.dart';
import 'package:shimmer/shimmer.dart';

class screenShot_item extends StatelessWidget {
  const screenShot_item({
    super.key,
    required this.imgeUrl,
  });

  final String imgeUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(20.r),
          child: SizedBox(
            height: 167.h,
            width: 398.w,
            child: CachedNetworkImage(
              imageUrl: imgeUrl,
              placeholder: (context, url) => Shimmer.fromColors(
                baseColor: const Color(0xFF121312),
                highlightColor: Colors.grey.shade700,
                child: Container(
                  width: 398.w,
                  height: 167.h,
                  decoration: BoxDecoration(
                    color: const Color(0xFF121312),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                ),
              ),
              errorWidget: (context, url, error) => const Icon(
                Icons.error,
                color: ThemeColors.yellow,
              ),
              fit: BoxFit.cover,
            ),
          )),
    );
  }
}
