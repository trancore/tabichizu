import 'package:tabichizu/data/model/places/lat_lng_literal.dart';

class BoundsModel {
  final LatLngLiteralModel northeast;
  final LatLngLiteralModel southwest;

  BoundsModel({
    required this.northeast,
    required this.southwest,
  });

  factory BoundsModel.fromJson(Map<String, dynamic> json) {
    late LatLngLiteralModel northeast;
    if (json['northeast'] != null) {
      var northeastJson = json['northeast'] as dynamic;
      northeast = LatLngLiteralModel.fromJson(northeastJson);
    }

    late LatLngLiteralModel southwest;
    if (json['southwest'] != null) {
      var southwestJson = json['southwest'] as dynamic;
      southwest = LatLngLiteralModel.fromJson(southwestJson);
    }

    return BoundsModel(
      northeast: northeast,
      southwest: southwest,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "northeast": northeast,
      "southwest": southwest,
    };
  }
}
