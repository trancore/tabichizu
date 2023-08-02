class LatLngLiteralModel {
  final num lat;
  final num lng;

  LatLngLiteralModel({
    required this.lat,
    required this.lng,
  });

  factory LatLngLiteralModel.fromJson(Map<String, dynamic> json) {
    return LatLngLiteralModel(
      lat: json['lat'] ?? "",
      lng: json['lng'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "lat": lat,
      "lng": lng,
    };
  }
}
