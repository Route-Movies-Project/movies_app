class IsFavouriteRepsonse {
  IsFavouriteRepsonse({
    required this.message,
    required this.data,
  });

  final String message;
  final bool data;

  factory IsFavouriteRepsonse.fromJson(Map<String, dynamic> json) {
    return IsFavouriteRepsonse(
      message: json["message"] ?? "",
      data: json["data"] ?? false,
    );
  }
}
