import 'dart:math';

import 'package:hive/hive.dart';
import 'package:social_lite_technical_test/models/post_model.dart';

class PostService {
  final _postBox = Hive.box<PostModel>('posts');

  Future<List<PostModel>> fetchMockPosts() async {
    await Future.delayed(const Duration(seconds: 2));

    final mockData = [
      PostModel(
        id: 'post_1',
        content: 'Just launched my portfolio website!',
        author: 'Arij Kortas',
        timestamp: DateTime.now().subtract(
          Duration(minutes: Random().nextInt(5)),
        ),
      ),
      PostModel(
        id: 'post_2',
        content: 'Loving Flutter development ❤️',
        author: 'Hadil Kortas',
        timestamp: DateTime.now().subtract(
          Duration(minutes: Random().nextInt(5)),
        ),
      ),
      PostModel(
        id: 'post_3',
        content: 'What do you prefer: GetX or Riverpod?',
        author: 'Layla Ahmed',
        timestamp: DateTime.now().subtract(
          Duration(minutes: Random().nextInt(5)),
        ),
      ),
      PostModel(
        id: 'post_4',
        content: 'Excited for my internship at Google!',
        author: 'Youssef Ben Ali',
        timestamp: DateTime.now().subtract(
          Duration(minutes: Random().nextInt(5)),
        ),
      ),
      PostModel(
        id: 'post_5',
        content: 'Excited to start my internship at Google next month! 🎉',
        author: 'Youssef Ben Ali',
        timestamp: DateTime.now().subtract(
          Duration(minutes: Random().nextInt(5)),
        ),
      ),
      PostModel(
        id: 'post_6',
        content:
            'Working on a Flutter chat app with WebSockets. Real-time is awesome 🔥',
        author: 'Tarek Haddad',
        timestamp: DateTime.now().subtract(
          Duration(minutes: Random().nextInt(5)),
        ),
      ),
    ];

    for (var post in mockData) {
      _postBox.put(post.id, post);
    }

    return mockData;
  }

  List<PostModel> getCachedPosts() {
    return _postBox.values.toList();
  }
}
