class DeleteFavouriteResposne {
  DeleteFavouriteResposne({
    required this.message,
  });

  final String message;

  factory DeleteFavouriteResposne.fromJson(Map<String, dynamic> json) {
    return DeleteFavouriteResposne(
      message: json["message"] ?? "",
    );
  }
}
