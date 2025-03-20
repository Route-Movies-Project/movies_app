import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/Themes/theme.dart';
import 'package:movies_app/core/observer/app_bloc_observer.dart';
import 'package:movies_app/core/service/service_locator.dart';
import 'package:movies_app/core/utils/constants/routes.dart';
import 'package:movies_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:movies_app/features/favourites/presentation/cubit/add_to_favourites_cubit.dart';
import 'package:movies_app/features/favourites/presentation/cubit/all_favourites_cubit.dart';
import 'package:movies_app/features/favourites/presentation/cubit/delete_favourite_cubit.dart';
import 'package:movies_app/features/favourites/presentation/cubit/is_favourite_cubit.dart';
import 'package:movies_app/features/home/cubit/movie_genre_index_cubit.dart';
import 'package:movies_app/features/home/cubit/movies_cubit.dart';
import 'package:movies_app/features/home/cubit/movies_genre_cubit.dart';
import 'package:movies_app/features/movie_detials/cubit/movie_details_cubit.dart';
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
          BlocProvider(create: (context) => getIt<AuthCubit>()),
          BlocProvider(create: (context) => getIt<ProfileCubit>()),
          BlocProvider(create: (context) => getIt<MovieDetailsCubit>()),
          BlocProvider(create: (context) => getIt<AddToFavouritesCubit>()),
          BlocProvider(create: (context) => getIt<DeleteFavouriteCubit>()),
          BlocProvider(create: (context) => getIt<IsFavouriteCubit>()),
          BlocProvider(create: (context) => getIt<MoviesCubit>()),
          BlocProvider(create: (context) => getIt<MoviesGenreCubit>()),
          BlocProvider(create: (context) => getIt<AllFavouritesCubit>()),
          BlocProvider(create: (context) => getIt<MovieGenreIndexCubit>()),
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
