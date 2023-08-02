class PlaceOpeningHoursPeriodDetailModel {
  final num day;
  final String time;
  final String? date;
  final bool? truncated;

  PlaceOpeningHoursPeriodDetailModel({
    required this.day,
    required this.time,
    this.date,
    this.truncated,
  });

  factory PlaceOpeningHoursPeriodDetailModel.fromJson(
      Map<String, dynamic> json) {
    return PlaceOpeningHoursPeriodDetailModel(
      day: json['day'],
      time: json['time'],
      date: json['date'] ?? "",
      truncated: json["truncated"] == null
          ? null
          : bool.tryParse(json['truncated'].toString(), caseSensitive: false),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "day": day,
      "time": time,
      "date": date,
      "truncated": truncated,
    };
  }
}
