import 'package:movies_app/features/favourites/data/model/all_favourites_response.dart';
import 'package:movies_app/features/favourites/domain/entities/favourit_movie.dart';

extension FavouriteMovieMapper on FavouriteMovieModel {
  FavouriteMovie get toEntity => FavouriteMovie(
        movieId,
        name,
        rating,
        imageUrl,
        year,
      );
}
