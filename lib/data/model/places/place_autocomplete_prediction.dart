import 'package:tabichizu/data/model/places/place_autocomplete_matched_substring.dart';
import 'package:tabichizu/data/model/places/place_autocomplete_structured_format.dart';
import 'package:tabichizu/data/model/places/place_autocomplete_term.dart';

class PlaceAutocompletePredictionModel {
  final String description;
  final List<PlaceAutocompleteMatchedSubstringModel> matchedSubstrings;
  final PlaceAutocompleteStructuredFormatModel structuredFormatting;
  final List<PlaceAutocompleteTermModel> terms;
  final int? distanceMeters;
  final String? placeId;
  final String? references;
  final List<String>? types;

  PlaceAutocompletePredictionModel({
    required this.description,
    required this.matchedSubstrings,
    required this.structuredFormatting,
    required this.terms,
    this.distanceMeters,
    this.placeId,
    this.references,
    this.types,
  });

  factory PlaceAutocompletePredictionModel.fromJson(Map<String, dynamic> json) {
    var matchedSubstrings = <PlaceAutocompleteMatchedSubstringModel>[];
    if (json['matched_substrings'] != null) {
      var matchedSubstringsJson = json['matched_substrings'] as List<dynamic>;
      for (var matchedSubstringJson in matchedSubstringsJson) {
        var matchedSubstring = PlaceAutocompleteMatchedSubstringModel.fromJson(
            matchedSubstringJson);
        matchedSubstrings.add(matchedSubstring);
      }
    }

    late PlaceAutocompleteStructuredFormatModel structuredFormatting;
    if (json['structured_formatting'] != null) {
      var structuredFormattingJson = json['structured_formatting'] as dynamic;
      structuredFormatting = PlaceAutocompleteStructuredFormatModel.fromJson(
          structuredFormattingJson);
    }

    var terms = <PlaceAutocompleteTermModel>[];
    if (json['terms'] != null) {
      var termsJson = json['terms'] as List<dynamic>;
      for (var termJson in termsJson) {
        var term = PlaceAutocompleteTermModel.fromJson(termJson);
        terms.add(term);
      }
    }

    var types = <String>[];
    if (json['types'] != null) {
      var typesJson = json['types'] as List<dynamic>;
      for (var typeJson in typesJson) {
        types.add(typeJson);
      }
    }

    return PlaceAutocompletePredictionModel(
      description: json['description'] ?? "",
      matchedSubstrings: matchedSubstrings,
      placeId: json['place_id'] ?? "",
      references: json['references'] ?? "",
      structuredFormatting: structuredFormatting,
      terms: terms,
      types: types,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "description": description,
      "matched_substrings": matchedSubstrings,
      "structured_formatting": structuredFormatting,
      "terms": terms,
      "distance_meters": distanceMeters,
      "place_id": placeId,
      "references": references,
      "types": types,
    };
  }
}
