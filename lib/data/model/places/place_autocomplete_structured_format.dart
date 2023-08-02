import 'package:tabichizu/data/model/places/place_autocomplete_matched_substring.dart';

class PlaceAutocompleteStructuredFormatModel {
  final String mainText;
  final List<PlaceAutocompleteMatchedSubstringModel> mainTextMatchedSubstrings;
  final String? secondaryText;
  final List<PlaceAutocompleteMatchedSubstringModel>?
      secondaryTextMatchedSubstrings;

  PlaceAutocompleteStructuredFormatModel({
    required this.mainText,
    required this.mainTextMatchedSubstrings,
    this.secondaryText,
    this.secondaryTextMatchedSubstrings,
  });

  factory PlaceAutocompleteStructuredFormatModel.fromJson(
      Map<String, dynamic> json) {
    var mainTextMatchedSubstrings = <PlaceAutocompleteMatchedSubstringModel>[];
    if (json['main_text_matched_substrings'] != null) {
      var mainTextMatchedSubstringsJson =
          json['main_text_matched_substrings'] as List<dynamic>;
      for (var mainTextMatchedSubstringJson in mainTextMatchedSubstringsJson) {
        var mainTextMatchedSubstring =
            PlaceAutocompleteMatchedSubstringModel.fromJson(
                mainTextMatchedSubstringJson);
        mainTextMatchedSubstrings.add(mainTextMatchedSubstring);
      }
    }

    var secondaryTextMatchedSubstrings =
        <PlaceAutocompleteMatchedSubstringModel>[];
    if (json['secondary_text_matched_substrings'] != null) {
      var secondaryTextMatchedSubstringsJson =
          json['secondary_text_matched_substrings'] as List<dynamic>;
      for (var secondaryTextMatchedSubstringJson
          in secondaryTextMatchedSubstringsJson) {
        var secondaryTextMatchedSubstring =
            PlaceAutocompleteMatchedSubstringModel.fromJson(
                secondaryTextMatchedSubstringJson);
        mainTextMatchedSubstrings.add(secondaryTextMatchedSubstring);
      }
    }

    return PlaceAutocompleteStructuredFormatModel(
        mainText: json['main_text'] ?? "",
        mainTextMatchedSubstrings: mainTextMatchedSubstrings,
        secondaryText: json['secondary_text'] ?? "",
        secondaryTextMatchedSubstrings: secondaryTextMatchedSubstrings);
  }

  Map<String, dynamic> toJson() {
    return {
      "main_text": mainText,
      "main_text_matched_substrings": mainTextMatchedSubstrings,
      "secondary_text": secondaryText,
      "secondary_text_matched_substrings": secondaryTextMatchedSubstrings,
    };
  }
}
