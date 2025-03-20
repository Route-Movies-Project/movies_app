class FavouritesResponse {
  FavouritesResponse({
    required this.message,
    required this.data,
  });

  final String message;
  final FavouritesData data;

  factory FavouritesResponse.fromJson(Map<String, dynamic> json) {
    return FavouritesResponse(
      message: json["message"],
      data: FavouritesData.fromJson(json["data"]),
    );
  }
}

class FavouritesData {
  FavouritesData({
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

  factory FavouritesData.fromJson(Map<String, dynamic> json) {
    return FavouritesData(
      movieId: json["movieId"],
      name: json["name"],
      rating: (json["rating"] as num).toDouble(),
      imageUrl: json["imageURL"],
      year: json["year"],
    );
  }
}
