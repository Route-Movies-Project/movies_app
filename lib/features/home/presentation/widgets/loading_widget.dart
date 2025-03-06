import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Stack(
          children: [
            Shimmer.fromColors(
              baseColor: const Color(0xFF121312),
              highlightColor: Colors.grey.shade700,
              child: Container(
                width: double.infinity,
                height: 645.h,
                decoration: const BoxDecoration(
                  color: Color(0xFF121312),
                ),
              ),
            ),
          ],
        ),
        Column(
          children: [
            Image.asset("assets/images/Available Now.png"),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: CarouselSlider.builder(
                options: CarouselOptions(
                  scrollDirection: Axis.horizontal,
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                  enlargeFactor: 0.4,
                  viewportFraction: 0.6,
                  height: 350.h,
                ),
                itemCount: 3,
                itemBuilder: (BuildContext context, int index, _) {
                  return Shimmer.fromColors(
                    baseColor: const Color(0xFF282A28),
                    highlightColor: Colors.grey.shade500,
                    child: Container(
                      width: 234.w,
                      height: 351.h,
                      decoration: BoxDecoration(
                        color: const Color(0xFF282A28),
                        borderRadius: BorderRadius.circular(
                          20.r,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Image.asset("assets/images/Watch Now.png"),
          ],
        ),
      ],
    );
  }
}
