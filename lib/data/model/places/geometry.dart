import 'package:tabichizu/data/model/places/bounds.dart';
import 'package:tabichizu/data/model/places/lat_lng_literal.dart';

class GeometryModel {
  final LatLngLiteralModel location;
  final BoundsModel viewport;

  GeometryModel({
    required this.location,
    required this.viewport,
  });

  factory GeometryModel.fromJson(Map<String, dynamic> json) {
    late LatLngLiteralModel location;
    if (json['location'] != null) {
      var locationJson = json['location'] as dynamic;
      location = LatLngLiteralModel.fromJson(locationJson);
    }

    late BoundsModel viewport;
    if (json['viewport'] != null) {
      var viewportJson = json['viewport'] as dynamic;
      viewport = BoundsModel.fromJson(viewportJson);
    }

    return GeometryModel(
      location: location,
      viewport: viewport,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "location": location,
      "viewport": viewport,
    };
  }
}
