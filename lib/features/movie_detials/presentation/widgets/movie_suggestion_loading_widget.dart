import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class MovieSuggestionLoadingWidget extends StatelessWidget {
  const MovieSuggestionLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 610.h,
      width: double.infinity,
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 4,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16.h,
          crossAxisSpacing: 20.w,
          childAspectRatio: 189.w / 279.h,
        ),
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            baseColor: const Color(0xFF282A28),
            highlightColor: Colors.grey.shade500,
            child: Container(
              width: 189.w,
              height: 279.h,
              decoration: BoxDecoration(
                color: const Color(0xFF282A28),
                borderRadius: BorderRadius.circular(
                  16.r,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
