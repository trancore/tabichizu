import 'package:tabichizu/data/model/places/place_autocomplete_prediction.dart';

class PlacesAutocompleteModel {
  final List<PlaceAutocompletePredictionModel> predictions;
  final String status;

  PlacesAutocompleteModel({required this.predictions, required this.status});

  factory PlacesAutocompleteModel.fromJson(Map<String, dynamic> json) {
    var predictions = <PlaceAutocompletePredictionModel>[];
    if (json['predictions'] != null) {
      var predictionsJson = json['predictions'] as List<dynamic>;
      for (var predictionJson in predictionsJson) {
        var prediction =
            PlaceAutocompletePredictionModel.fromJson(predictionJson);
        predictions.add(prediction);
      }
    }

    return PlacesAutocompleteModel(
      predictions: predictions,
      status: json['status'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {"predictions": predictions, "status": status};
  }
}
