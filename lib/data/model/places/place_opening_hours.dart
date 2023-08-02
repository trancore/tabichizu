import 'package:tabichizu/data/model/places/place_opening_hours_period.dart';
import 'package:tabichizu/data/model/places/place_special_day.dart';

class PlaceOpeningHoursModel {
  final bool? openNow;
  final List<PlaceOpeningHoursPeriodModel>? periods;
  final List<PlaceSpecialDaydModel>? specialDays;
  final String? type;
  final List<String>? weekdayText;

  PlaceOpeningHoursModel({
    this.openNow,
    this.periods,
    this.specialDays,
    this.type,
    this.weekdayText,
  });

  factory PlaceOpeningHoursModel.fromJson(Map<String, dynamic> json) {
    var periods = <PlaceOpeningHoursPeriodModel>[];
    if (json['periods'] != null) {
      var periodsJson = json['periods'] as List<dynamic>;
      for (var periodJson in periodsJson) {
        var period = PlaceOpeningHoursPeriodModel.fromJson(periodJson);
        periods.add(period);
      }
    }

    var specialDays = <PlaceSpecialDaydModel>[];
    if (json['special_days'] != null) {
      var specialDaysJson = json['special_days'] as List<dynamic>;
      for (var specialDayJson in specialDaysJson) {
        var specialDay = PlaceSpecialDaydModel.fromJson(specialDayJson);
        specialDays.add(specialDay);
      }
    }

    var weekdaysText = <String>[];
    if (json['weekday_text'] != null) {
      var weekdaysTextJson = json['weekday_text'] as List<dynamic>;
      for (var weekdayTextJson in weekdaysTextJson) {
        weekdaysText.add(weekdayTextJson);
      }
    }

    return PlaceOpeningHoursModel(
      openNow: json['open_now'] == null
          ? null
          : bool.tryParse(json['open_now'].toString(), caseSensitive: false),
      periods: periods,
      specialDays: specialDays,
      type: json['type'],
      weekdayText: weekdaysText,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "open_now": openNow,
      "periods": periods,
      "special_days": specialDays,
      "type": type,
      "weekday_text": weekdayText,
    };
  }
}
