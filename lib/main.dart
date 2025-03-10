import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/Themes/theme.dart';
import 'package:movies_app/core/observer/app_bloc_observer.dart';
import 'package:movies_app/core/service/service_locator.dart';
import 'package:movies_app/core/utils/constants/routes.dart';
import 'package:movies_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:movies_app/features/profile/cubit/profile_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await setupLocator();

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      saveLocale: true,
      startLocale: const Locale('en'),
      path: 'assets/translations',
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => getIt.get<AuthCubit>()),
          BlocProvider(create: (context) => getIt.get<ProfileCubit>()),
        ],
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
