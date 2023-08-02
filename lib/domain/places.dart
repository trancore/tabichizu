import 'dart:async';
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:rxdart/rxdart.dart';
import 'package:tabichizu/data/constants/environments.dart';
import 'package:tabichizu/data/model/places/places_autocomplete.dart';
import 'package:tabichizu/data/model/places/places_details.dart';

class PlacesBloc {
  final _urlString = "https://maps.googleapis.com/maps/api/place";
  final _apiKey = dotenv.env[placesApiKey];

  final _placesAutocompleteDataController =
      BehaviorSubject<PlacesAutocompleteModel?>();
  final _placesDetailsDataController = BehaviorSubject<PlacesDetailsModel?>();

  get autocompleteDataStream => _placesAutocompleteDataController.stream;

  Stream<PlacesDetailsModel?> get detailsDataStream =>
      _placesDetailsDataController.stream;

  Future getPlacesAutocomplete(String? input) async {
    try {
      final url = Uri.parse(
          '$_urlString/autocomplete/json?input=$input&language=ja&components=country:jpn&key=$_apiKey');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final body = response.body;
        dynamic jsonBody = jsonDecode(body);
        PlacesAutocompleteModel data =
            PlacesAutocompleteModel.fromJson(jsonBody);
        _placesAutocompleteDataController.add(data);
      } else {
        _placesAutocompleteDataController.addError('Failed to fetch data');
      }
    } catch (error) {
      _placesAutocompleteDataController.addError('Failed to fetch data');
    }
  }

  Future getPlacesDetails(String? input) async {
    try {
      final url = Uri.parse(
          '$_urlString/details/json?place_id=$input&language=ja&key=$_apiKey');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final body = response.body;
        dynamic jsonBody = jsonDecode(body);
        PlacesDetailsModel data = PlacesDetailsModel.fromJson(jsonBody);

        _placesDetailsDataController.add(data);
      } else {
        _placesDetailsDataController.addError('Failed to fetch data');
      }
    } catch (error) {
      _placesDetailsDataController.addError('Failed to fetch data');
    }
  }

  void clearAutocomplete() {
    _placesAutocompleteDataController.add(null);
  }

  void disposeAutoComplete() {
    _placesAutocompleteDataController.close();
  }

  void disposeDetail() {
    _placesDetailsDataController.close();
  }

  void dispose() {
    disposeAutoComplete();
    disposeDetail();
  }
}
