import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/Themes/colors.dart';
import 'package:movies_app/core/service/service_locator.dart';
import 'package:movies_app/features/favourites/presentation/cubit/add_to_favourites_cubit.dart';
import 'package:movies_app/features/favourites/presentation/cubit/delete_favourite_cubit.dart';
import 'package:movies_app/features/favourites/presentation/cubit/favourites_states.dart';
import 'package:movies_app/features/favourites/presentation/cubit/is_favourite_cubit.dart';

class CustomArrowBack extends StatelessWidget {
  const CustomArrowBack({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 37.w,
      height: 58.h,
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        color: ThemeColors.white,
        onPressed: () {
          if (getIt<AddToFavouritesCubit>().state is FavouritesLoading ||
              getIt<DeleteFavouriteCubit>().state is DeleteFavouriteLoading ||
              getIt<IsFavouriteCubit>().state is IsFavouriteLoading) {
          } else {
            Navigator.of(context).pop();
          }
        },
      ),
    );
  }
}
