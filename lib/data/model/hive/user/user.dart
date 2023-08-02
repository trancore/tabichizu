import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 1)
class User extends HiveObject {
  User({this.userName, this.image, this.theme});

  @HiveField(0)
  String? userName;

  @HiveField(1)
  String? image;

  @HiveField(2)
  int? theme;
}
