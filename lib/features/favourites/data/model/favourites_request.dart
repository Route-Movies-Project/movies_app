class FavouriteModel {
  const FavouriteModel({
    required this.movieId,
    required this.name,
    required this.rating,
    required this.imageUrl,
    required this.year,
  });

  final String movieId;
  final String name;
  final double rating;
  final String imageUrl;
  final String year;

  Map<String, dynamic> toJson() => {
        "movieId": movieId,
        "name": name,
        "rating": rating,
        "imageURL": imageUrl,
        "year": year,
      };
}
