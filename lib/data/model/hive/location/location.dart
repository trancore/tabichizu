import 'package:hive/hive.dart';

part 'location.g.dart';

@HiveType(typeId: 2)
class Location extends HiveObject {
  Location(
      {required this.id,
      required this.locationName,
      required this.prefecture,
      required this.lat,
      required this.lng});

  @HiveField(0)
  String id;

  @HiveField(1)
  String locationName;

  @HiveField(2)
  String prefecture;

  @HiveField(3)
  double lat;

  @HiveField(4)
  double lng;
}
