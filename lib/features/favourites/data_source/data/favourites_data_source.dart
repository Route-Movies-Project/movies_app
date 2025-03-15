import 'package:movies_app/features/favourites/data_source/model/delete_favourite_response.dart';
import 'package:movies_app/features/favourites/data_source/model/favourites_request.dart';
import 'package:movies_app/features/favourites/data_source/model/favourites_response.dart';
import 'package:movies_app/features/favourites/data_source/model/is_favourite_resposne.dart';

abstract class FavouritesDataSource {
  Future<FavouritesResponse> addToFavourite(FavouriteModel favouriteRequest);
  Future<DeleteFavouriteResposne> deleteFavourite(int movieId);
  Future<IsFavouriteRepsonse> getIsFavourite(int movieId);
}
