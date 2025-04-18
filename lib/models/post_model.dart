import 'package:hive/hive.dart';
part 'post_model.g.dart';

@HiveType(typeId: 1)
class PostModel extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String content;
  @HiveField(2)
  final String author;
  @HiveField(3)
  final DateTime timestamp;

  PostModel({
    required this.id,
    required this.content,
    required this.author,
    required this.timestamp,
  });
}
