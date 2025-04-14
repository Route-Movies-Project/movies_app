import 'package:equatable/equatable.dart';

class FavouriteMovie extends Equatable {
  final String movieId;
  final String name;
  final double rating;
  final String imageUrl;
  final String year;

  const FavouriteMovie(
    this.movieId,
    this.name,
    this.rating,
    this.imageUrl,
    this.year,
  );

  @override
  List<Object?> get props => [name];
}
