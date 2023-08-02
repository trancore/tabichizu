class PlaceAutocompleteTermModel {
  final int offset;
  final String value;

  PlaceAutocompleteTermModel({
    required this.offset,
    required this.value,
  });

  factory PlaceAutocompleteTermModel.fromJson(dynamic json) {
    return PlaceAutocompleteTermModel(
      offset: json['offset'] ?? "",
      value: json['value'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "offset": offset,
      "value": value,
    };
  }
}
