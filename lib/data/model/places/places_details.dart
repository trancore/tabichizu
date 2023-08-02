import 'package:tabichizu/data/model/places/place.dart';
import 'package:tabichizu/main.dart';

class PlacesDetailsModel {
  final List<String> htmlAttributions;
  final PlaceModel result;
  final String status;
  final List<String>? infoMessages;

  PlacesDetailsModel({
    required this.htmlAttributions,
    required this.result,
    required this.status,
    this.infoMessages,
  });

  factory PlacesDetailsModel.fromJson(Map<String, dynamic> json) {
    var htmlAttributions = <String>[];
    if (json['html_attributions'] != null) {
      var htmlAttributionsJson = json['html_attributions'] as List<dynamic>;
      for (var htmlAttributionJson in htmlAttributionsJson) {
        htmlAttributions.add(htmlAttributionJson);
      }
    }

    late PlaceModel result;
    if (json['result'] != null) {
      var resultJson = json['result'] as dynamic;
      result = PlaceModel.fromJson(resultJson);
    }

    var infoMessages = <String>[];
    if (json['info_messages'] != null) {
      var infoMessagesJson = json['info_messages'] as List<dynamic>;
      logger.info('infoMessage: $infoMessagesJson');
      for (var infoMessageJson in infoMessagesJson) {
        infoMessages.add(infoMessageJson);
      }
    }

    return PlacesDetailsModel(
      htmlAttributions: htmlAttributions,
      result: result,
      status: json['status'],
      infoMessages: infoMessages,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "html_attributions": htmlAttributions,
      "result": result,
      "status": status,
      "info_messages": infoMessages
    };
  }
}
