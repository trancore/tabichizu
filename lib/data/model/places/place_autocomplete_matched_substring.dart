class PlaceAutocompleteMatchedSubstringModel {
  final int length;
  final int offset;

  PlaceAutocompleteMatchedSubstringModel(
      {required this.length, required this.offset});

  factory PlaceAutocompleteMatchedSubstringModel.fromJson(
      Map<String, dynamic> json) {
    return PlaceAutocompleteMatchedSubstringModel(
      length: json['length'] ?? "",
      offset: json['offset'] ?? "",
    );
  }

  Map<String, int> toJson() {
    return {"length": length, "offset": offset};
  }
}
