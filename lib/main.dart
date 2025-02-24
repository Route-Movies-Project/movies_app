import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/Themes/theme.dart';
import 'package:movies_app/register/register_body.dart';

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
        debugShowCheckedModeBanner: false,
        title: 'Movies',
        theme: theme,
        routes: {
          RegisterBody.routeName:(_) => RegisterBody(),
        },
        initialRoute: RegisterBody.routeName,
      ),
    );
  }
}
