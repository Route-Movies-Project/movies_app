class AllFavouritesRepsonse {
  AllFavouritesRepsonse({
    required this.message,
    required this.data,
  });

  final String message;
  final List<FavouriteMovieModel> data;

  factory AllFavouritesRepsonse.fromJson(Map<String, dynamic> json) {
    return AllFavouritesRepsonse(
      message: json["message"] ?? "",
      data: json["data"] == null
          ? []
          : List<FavouriteMovieModel>.from(
              json["data"]!.map((x) => FavouriteMovieModel.fromJson(x))),
    );
  }
}

class FavouriteMovieModel {
  FavouriteMovieModel({
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

  factory FavouriteMovieModel.fromJson(Map<String, dynamic> json) {
    return FavouriteMovieModel(
      movieId: json["movieId"] ?? "",
      name: json["name"] ?? "",
      rating: (json["rating"] is int)
          ? (json["rating"] as int).toDouble()
          : (json["rating"] ?? 0.0),
      imageUrl: json["imageURL"] ?? "",
      year: json["year"] ?? "",
    );
  }
}
