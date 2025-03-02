import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/Themes/theme.dart';
import 'package:movies_app/core/observer/app_bloc_observer.dart';
import 'package:movies_app/core/utils/constants/routes.dart';
import 'package:movies_app/features/auth/cubit/auth_cubit.dart';
import 'package:movies_app/service/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  setupLocator();
  Bloc.observer = MyBlocObserver();
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      saveLocale: true,
      startLocale: const Locale('en'),
      path: 'assets/translations',
      child: BlocProvider(
        create: (context) => AuthCubit(),
        child: const Movies(),
      ),
    ),
  );
}

class Movies extends StatelessWidget {
  const Movies({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          title: 'Movies',
          theme: theme,
          routes: AppRoutes.routes,
          initialRoute: AppRoutes.initialRoute,
        );
      },
    );
  }
}
