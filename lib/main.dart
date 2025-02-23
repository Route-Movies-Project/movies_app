import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const Movies());
}

class Movies extends StatelessWidget {
  const Movies({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430, 932),
      minTextAdapt: true,
      child: MaterialApp(
        title: 'Movies',
        routes: {},
      ),
    );
  }
}
