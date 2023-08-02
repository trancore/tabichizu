class AddressComponentModel {
  final String longName;
  final String shortName;
  final List<String> types;

  AddressComponentModel({
    required this.longName,
    required this.shortName,
    required this.types,
  });

  factory AddressComponentModel.fromJson(Map<String, dynamic> json) {
    var types = <String>[];
    if (json['types'] != null) {
      var typesJson = json['types'] as List<dynamic>;
      for (var typeJson in typesJson) {
        types.add(typeJson);
      }
    }

    return AddressComponentModel(
      longName: json['long_name'],
      shortName: json['short_name'],
      types: types,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "long_name": longName,
      "short_name": shortName,
      "types": types,
    };
  }
}
