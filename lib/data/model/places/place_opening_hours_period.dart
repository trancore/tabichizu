import 'package:tabichizu/data/model/places/place_opening_hours_period_detail.dart';

class PlaceOpeningHoursPeriodModel {
  final PlaceOpeningHoursPeriodDetailModel open;
  final PlaceOpeningHoursPeriodDetailModel? close;

  PlaceOpeningHoursPeriodModel({
    required this.open,
    this.close,
  });

  factory PlaceOpeningHoursPeriodModel.fromJson(Map<String, dynamic> json) {
    late PlaceOpeningHoursPeriodDetailModel open;
    if (json['open'] != null) {
      var openJson = json['open'] as dynamic;
      open = PlaceOpeningHoursPeriodDetailModel.fromJson(openJson);
    }

    PlaceOpeningHoursPeriodDetailModel? close;
    if (json['close'] != null) {
      var closeJson = json['close'] as dynamic;
      close = PlaceOpeningHoursPeriodDetailModel.fromJson(closeJson);
    }

    return PlaceOpeningHoursPeriodModel(
      open: open,
      close: close,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "open": open,
      "close": close,
    };
  }
}
