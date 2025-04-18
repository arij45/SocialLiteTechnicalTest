import 'package:hive/hive.dart';
part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel extends HiveObject {
  @HiveField(0)
  late String username;

  @HiveField(1)
  late String email;

  @HiveField(2)
  late String password;

  @HiveField(3)
  late String title;

  @HiveField(4)
  late String status;

  @HiveField(5)
  String? imageUrl;

  UserModel({
    required this.username,
    required this.email,
    required this.password,
    required this.title,
    required this.status,
    required this.imageUrl,
  });
}
