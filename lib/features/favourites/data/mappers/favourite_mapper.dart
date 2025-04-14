import 'package:movies_app/features/favourites/data/model/favourites_response.dart';
import 'package:movies_app/features/favourites/domain/entities/favourite.dart';

extension FavouriteMapper on FavouritesResponse {
  Favourite get toEntity => Favourite(message);
}
