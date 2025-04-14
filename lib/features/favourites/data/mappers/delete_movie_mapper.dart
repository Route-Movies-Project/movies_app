import 'package:movies_app/features/favourites/data/model/delete_favourite_response.dart';
import 'package:movies_app/features/favourites/domain/entities/delete_favourite.dart';

extension DeleteMovieMapper on DeleteFavouriteResposne {
  DeleteFavourite get toEntity => DeleteFavourite(message);
}
