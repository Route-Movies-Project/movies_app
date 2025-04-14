import 'package:movies_app/features/favourites/data/model/is_favourite_resposne.dart';
import 'package:movies_app/features/favourites/domain/entities/is_favourite.dart';

extension IsFavouriteMapper on IsFavouriteRepsonse {
  IsFavourite get toEntity => IsFavourite(message, data);
}
