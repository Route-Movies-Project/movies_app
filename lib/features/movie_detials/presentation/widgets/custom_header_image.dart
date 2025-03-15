import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:movies_app/core/Themes/colors.dart';
import 'package:movies_app/core/service/service_locator.dart';
import 'package:movies_app/core/shared/widgets/loading_indicator.dart';
import 'package:movies_app/core/utils/constants/images.dart';
import 'package:movies_app/core/utils/helper/helper_functions.dart';
import 'package:movies_app/features/favourites/data_source/model/favourites_request.dart';
import 'package:movies_app/features/favourites/presentation/cubit/add_to_favourites_cubit.dart';
import 'package:movies_app/features/favourites/presentation/cubit/delete_favourite_cubit.dart';
import 'package:movies_app/features/favourites/presentation/cubit/favourites_states.dart';
import 'package:movies_app/features/favourites/presentation/cubit/is_favourite_cubit.dart';
import 'package:movies_app/features/movie_detials/data/model/movie_details_response.dart';
import 'package:movies_app/features/movie_detials/presentation/widgets/custom_arrow_back.dart';
import 'package:movies_app/features/movie_detials/presentation/widgets/custom_gradient.dart';
import 'package:movies_app/features/movie_detials/presentation/widgets/custom_movie_title.dart';
import 'package:movies_app/features/movie_detials/presentation/widgets/custom_network_image.dart';

class CustomHeaderImage extends StatelessWidget {
  const CustomHeaderImage({
    super.key,
    required this.movieDetails,
  });
  final MovieDetails movieDetails;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomNetworkImage(
          movieDetails: movieDetails,
        ),
        const CustomGradient(),
        SafeArea(
          child: SizedBox(
            height: 645.h,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CustomArrowBack(),
                      MultiBlocListener(
                        listeners: [
                          BlocListener<AddToFavouritesCubit, FavouritesStates>(
                            listener: (context, state) {
                              if (state is FavouritesLoading) {
                              } else if (state is FavouritesError) {
                                Fluttertoast.showToast(
                                  msg: state.errorMessage,
                                  gravity: ToastGravity.BOTTOM,
                                  toastLength: Toast.LENGTH_SHORT,
                                  backgroundColor: ThemeColors.yellow,
                                  textColor: ThemeColors.black,
                                );
                              } else if (state is FavouritesSuccess) {
                                Fluttertoast.showToast(
                                  msg: state.message,
                                  gravity: ToastGravity.BOTTOM,
                                  toastLength: Toast.LENGTH_SHORT,
                                  backgroundColor: ThemeColors.yellow,
                                  textColor: ThemeColors.black,
                                );
                              }
                            },
                          ),
                          BlocListener<DeleteFavouriteCubit, FavouritesStates>(
                            listener: (context, state) {
                              if (state is DeleteFavouriteLoading) {
                              } else if (state is DeleteFavouritesError) {
                                Fluttertoast.showToast(
                                  msg: state.errorMessage,
                                  gravity: ToastGravity.BOTTOM,
                                  toastLength: Toast.LENGTH_SHORT,
                                  backgroundColor: ThemeColors.yellow,
                                  textColor: ThemeColors.black,
                                );
                              } else if (state is DeleteFavouriteSuccess) {
                                Fluttertoast.showToast(
                                  msg: state.message,
                                  gravity: ToastGravity.BOTTOM,
                                  toastLength: Toast.LENGTH_SHORT,
                                  backgroundColor: ThemeColors.yellow,
                                  textColor: ThemeColors.black,
                                );
                              }
                            },
                          ),
                        ],
                        child: BlocBuilder<IsFavouriteCubit, FavouritesStates>(
                          builder: (context, state) {
                            if (state is IsFavouriteLoading) {
                              return const LoadingIndicator();
                            } else if (state is IsFavouritesError) {
                              return Text(state.errorMessage);
                            } else if (state is IsFavouriteSuccess) {
                              return Container(
                                width: 50.w,
                                height: 58.h,
                                decoration: BoxDecoration(
                                  color: Colors.black.withValues(
                                    alpha: 0.5,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    12.r,
                                  ),
                                ),
                                child: IconButton(
                                  onPressed: () async {
                                    if (state.isFavourite == true) {
                                      await getIt<DeleteFavouriteCubit>()
                                          .deleteFavouirte(movieDetails.id);
                                    } else {
                                      await getIt<AddToFavouritesCubit>()
                                          .addToFavourite(
                                        FavouriteModel(
                                          movieId: movieDetails.id.toString(),
                                          name: movieDetails.title,
                                          rating: movieDetails.rating,
                                          imageUrl:
                                              movieDetails.largeCoverImage,
                                          year: movieDetails.year.toString(),
                                        ),
                                      );
                                    }
                                    getIt<IsFavouriteCubit>()
                                        .getIsFavourite(movieDetails.id);
                                  },
                                  icon: Icon(
                                    state.isFavourite == true
                                        ? Icons.bookmark
                                        : Icons.bookmark_border,
                                    color: ThemeColors.white,
                                  ),
                                ),
                              );
                            } else {
                              return const SizedBox.shrink();
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 210.h,
                ),
                SvgPicture.asset(
                  AppAssets.playTap,
                ),
                const Spacer(),
                SizedBox(
                  height: 20.h,
                ),
                CustomMovieTitle(
                  movieDetails: movieDetails,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  movieDetails.year.toString(),
                  style: HelperFunction.textTheme(context).bodyMedium,
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
