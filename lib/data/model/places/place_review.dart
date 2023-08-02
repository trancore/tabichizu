class PlaceReviewModel {
  final String authorName;
  final num rating;
  final String relativeTimeDescription;
  final num time;
  final String? authorUrl;
  final String? language;
  final String? originalLanguage;
  final String? profilePhotoUrl;
  final String? text;
  final bool? translated;

  PlaceReviewModel({
    required this.authorName,
    required this.rating,
    required this.relativeTimeDescription,
    required this.time,
    this.authorUrl,
    this.language,
    this.originalLanguage,
    this.profilePhotoUrl,
    this.text,
    this.translated,
  });

  factory PlaceReviewModel.fromJson(Map<String, dynamic> json) {
    return PlaceReviewModel(
      authorName: json['author_name'],
      rating: json['rating'],
      relativeTimeDescription: json['relative_time_description'],
      time: json['time'],
      authorUrl: json['author_url'],
      language: json['language'],
      originalLanguage: json['original_language'],
      profilePhotoUrl: json['profile_photo_url'],
      text: json['text'],
      translated: json['translated'] == null
          ? null
          : bool.parse(json['translated'].toString()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "author_name": authorName,
      "rating": rating,
      "relative_time_description": relativeTimeDescription,
      "time": time,
      "author_url": authorUrl,
      "language": language,
      "original_language": originalLanguage,
      "profile_photo_url": profilePhotoUrl,
      "text": text,
      "translated": translated,
    };
  }
}
