import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:social_lite_technical_test/providers/post_provider.dart';
import 'package:social_lite_technical_test/styles/colors/app_colors.dart';
import 'package:social_lite_technical_test/widgets/app_bar_widget.dart';
import 'package:social_lite_technical_test/widgets/bottom_nav_bar_widget.dart';
import 'package:social_lite_technical_test/widgets/post_card.widget.dart';
import 'package:social_lite_technical_test/widgets/post_search_bar_widget.dart';
import '../../controllers/post_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final postController = Get.find<PostController>();
    return ChangeNotifierProvider(
      create: (_) => PostProvider(),
      child: Scaffold(
        appBar: AppBarWidget(title: "Hey there, Socialite!"),
        body: Obx(() {
          if (postController.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.secondary),
            );
          }
          return Consumer<PostProvider>(
            builder: (context, provider, _) {
              final filteredPosts =
                  postController.posts.where((post) {
                    return post.author.toLowerCase().contains(
                      provider.filter.toLowerCase(),
                    );
                  }).toList();

              return RefreshIndicator(
                onRefresh: postController.refreshPosts,
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 16.h,
                  ),
                  itemCount: filteredPosts.length + 1,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return const Padding(
                        padding: EdgeInsets.only(bottom: 16.0),
                        child: PostSearchBar(),
                      );
                    }
                    return PostCard(post: filteredPosts[index - 1]);
                  },
                ),
              );
            },
          );
        }),
       
      ),
    );
  }
}
