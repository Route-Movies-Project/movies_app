class MovieDetailsResponse {
  MovieDetailsResponse({
    required this.status,
    required this.statusMessage,
    required this.data,
    required this.meta,
  });

  final String status;
  final String statusMessage;
  final Data data;
  final Meta meta;

  factory MovieDetailsResponse.fromJson(Map<String, dynamic> json) {
    return MovieDetailsResponse(
      status: json["status"] ?? "",
      statusMessage: json["status_message"] ?? "",
      data: Data.fromJson(json["data"]),
      meta: Meta.fromJson(json["@meta"]),
    );
  }
}

class Data {
  Data({
    required this.movie,
  });

  final MovieDetails movie;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      movie: MovieDetails.fromJson(json["movie"]),
    );
  }
}

class MovieDetails {
  MovieDetails({
    required this.id,
    required this.url,
    required this.imdbCode,
    required this.title,
    required this.titleEnglish,
    required this.titleLong,
    required this.slug,
    required this.year,
    required this.rating,
    required this.runtime,
    required this.genres,
    required this.likeCount,
    required this.descriptionIntro,
    required this.descriptionFull,
    required this.ytTrailerCode,
    required this.language,
    required this.mpaRating,
    required this.backgroundImage,
    required this.backgroundImageOriginal,
    required this.smallCoverImage,
    required this.mediumCoverImage,
    required this.largeCoverImage,
    required this.torrents,
    this.dateUploaded,
    required this.dateUploadedUnix,
  });

  final int id;
  final String url;
  final String imdbCode;
  final String title;
  final String titleEnglish;
  final String titleLong;
  final String slug;
  final int year;
  final double rating;
  final int runtime;
  final List<String> genres;
  final int likeCount;
  final String descriptionIntro;
  final String descriptionFull;
  final String ytTrailerCode;
  final String language;
  final String mpaRating;
  final String backgroundImage;
  final String backgroundImageOriginal;
  final String smallCoverImage;
  final String mediumCoverImage;
  final String largeCoverImage;
  final List<Torrent> torrents;
  final DateTime? dateUploaded;
  final int dateUploadedUnix;

  factory MovieDetails.fromJson(Map<String, dynamic> json) {
    return MovieDetails(
      id: json["id"] ?? 0,
      url: json["url"] ?? "",
      imdbCode: json["imdb_code"] ?? "",
      title: json["title"] ?? "",
      titleEnglish: json["title_english"] ?? "",
      titleLong: json["title_long"] ?? "",
      slug: json["slug"] ?? "",
      year: json["year"] ?? 0,
      rating: (json["rating"] is int)
          ? (json["rating"] as int).toDouble()
          : (json["rating"] ?? 0.0),
      runtime: json["runtime"] ?? 0,
      genres: json["genres"] == null
          ? []
          : List<String>.from(json["genres"]!.map((x) => x)),
      likeCount: json["like_count"] ?? 0,
      descriptionIntro: json["description_intro"] ?? "",
      descriptionFull: json["description_full"] ?? "",
      ytTrailerCode: json["yt_trailer_code"] ?? "",
      language: json["language"] ?? "",
      mpaRating: json["mpa_rating"] ?? "",
      backgroundImage: json["background_image"] ?? "",
      backgroundImageOriginal: json["background_image_original"] ?? "",
      smallCoverImage: json["small_cover_image"] ?? "",
      mediumCoverImage: json["medium_cover_image"] ?? "",
      largeCoverImage: json["large_cover_image"] ?? "",
      torrents: json["torrents"] == null
          ? []
          : List<Torrent>.from(
              json["torrents"]!.map((x) => Torrent.fromJson(x))),
      dateUploaded: DateTime.tryParse(
              (json["date_uploaded"] ?? "").replaceFirst(" ", "T")) ??
          DateTime.now(),
      dateUploadedUnix: json["date_uploaded_unix"] ?? 0,
    );
  }
}

class Torrent {
  Torrent({
    required this.url,
    required this.hash,
    required this.quality,
    required this.type,
    required this.isRepack,
    required this.videoCodec,
    required this.bitDepth,
    required this.audioChannels,
    required this.seeds,
    required this.peers,
    required this.size,
    required this.sizeBytes,
    required this.dateUploaded,
    required this.dateUploadedUnix,
  });

  final String url;
  final String hash;
  final String quality;
  final String type;
  final String isRepack;
  final String videoCodec;
  final String bitDepth;
  final String audioChannels;
  final int seeds;
  final int peers;
  final String size;
  final int sizeBytes;
  final DateTime dateUploaded;
  final int dateUploadedUnix;

  factory Torrent.fromJson(Map<String, dynamic> json) {
    return Torrent(
      url: json["url"] ?? "",
      hash: json["hash"] ?? "",
      quality: json["quality"] ?? "",
      type: json["type"] ?? "",
      isRepack: json["is_repack"] ?? "",
      videoCodec: json["video_codec"] ?? "",
      bitDepth: json["bit_depth"] ?? "",
      audioChannels: json["audio_channels"] ?? "",
      seeds: json["seeds"] ?? 0,
      peers: json["peers"] ?? 0,
      size: json["size"] ?? "",
      sizeBytes: json["size_bytes"] ?? 0,
      dateUploaded: DateTime.tryParse(
            (json["date_uploaded"] ?? ""),
          ) ??
          DateTime.now(),
      dateUploadedUnix: json["date_uploaded_unix"] ?? 0,
    );
  }
}

class Meta {
  Meta({
    required this.serverTime,
    required this.serverTimezone,
    required this.apiVersion,
    required this.executionTime,
  });

  final int serverTime;
  final String serverTimezone;
  final int apiVersion;
  final String executionTime;

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      serverTime: json["server_time"] ?? 0,
      serverTimezone: json["server_timezone"] ?? "",
      apiVersion: json["api_version"] ?? 0,
      executionTime: json["execution_time"] ?? "",
    );
  }
}
