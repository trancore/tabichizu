class PlaceSpecialDaydModel {
  final String? date;
  final bool? exceptionalHours;

  PlaceSpecialDaydModel({
    this.date,
    this.exceptionalHours,
  });

  factory PlaceSpecialDaydModel.fromJson(Map<String, dynamic> json) {
    return PlaceSpecialDaydModel(
      date: json['date'],
      exceptionalHours: json['exceptional_hours'] == null
          ? null
          : bool.parse(json['exceptional_hours'].toString()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "date": date,
      "exceptional_hours": exceptionalHours,
    };
  }
}
