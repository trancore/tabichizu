class PlacePhotoModel {
  final num height;
  final List<String> htmlAttributions;
  final String photoReference;
  final num width;

  PlacePhotoModel({
    required this.height,
    required this.htmlAttributions,
    required this.photoReference,
    required this.width,
  });

  factory PlacePhotoModel.fromJson(Map<String, dynamic> json) {
    var htmlAttributions = <String>[];
    if (json['html_attributions'] != null) {
      var htmlAttributionsJson = json['html_attributions'] as List<dynamic>;
      for (var htmlAttributionJson in htmlAttributionsJson) {
        htmlAttributions.add(htmlAttributionJson);
      }
    }

    return PlacePhotoModel(
      height: json['height'],
      htmlAttributions: htmlAttributions,
      photoReference: json['photo_reference'],
      width: json['width'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "height": height,
      "html_attributions": htmlAttributions,
      "photo_reference": photoReference,
      "width": width,
    };
  }
}
