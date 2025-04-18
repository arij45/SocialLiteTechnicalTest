import 'package:social_lite_technical_test/models/post_model.dart';
import 'package:social_lite_technical_test/services/post_service.dart';
import 'package:get/get.dart';

class PostController extends GetxController {
  final posts = <PostModel>[].obs;
  final isLoading = false.obs;
  final postService = PostService();

  @override
  void onInit() {
    super.onInit();
    loadPosts();
  }

  Future<void> loadPosts() async {
    isLoading.value = true;
    posts.value = postService.getCachedPosts();

    final newPosts = await postService.fetchMockPosts();
    posts.value = newPosts;
    isLoading.value = false;
  }

  Future<void> refreshPosts() async {
    await loadPosts();
  }
}
