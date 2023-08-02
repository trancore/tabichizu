class PlaceEditorialSummaryModel {
  final String? language;
  final String? overview;

  PlaceEditorialSummaryModel({
    this.language,
    this.overview,
  });

  factory PlaceEditorialSummaryModel.fromJson(Map<String, dynamic> json) {
    return PlaceEditorialSummaryModel(
      language: json['language'] ?? "",
      overview: json['overview'] ?? "",
    );
  }

  Map<String, String?> toJson() {
    return {
      "language": language,
      "overview": overview,
    };
  }
}
