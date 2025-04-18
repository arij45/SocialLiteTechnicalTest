import 'package:hive/hive.dart';
part 'message_model.g.dart';

@HiveType(typeId: 2)
class MessageModel extends HiveObject {
  @HiveField(0)
  final String sender;

  @HiveField(1)
  final String text;

  @HiveField(2)
  final DateTime timestamp;

  @HiveField(3)
  final String profileImage;

  MessageModel({
    required this.sender,
    required this.text,
    required this.timestamp,
    required this.profileImage,
  });
}
