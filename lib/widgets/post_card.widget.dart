import 'package:flutter/material.dart';
import 'package:social_lite_technical_test/models/post_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_lite_technical_test/styles/fonts/font_styles.dart';
import 'package:social_lite_technical_test/utils/helpers.dart';
import 'package:social_lite_technical_test/widgets/post_action_widget.dart';

class PostCard extends StatelessWidget {
  final PostModel post;

  const PostCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.h,
      margin: EdgeInsets.only(bottom: 12.h),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      child: Padding(
        padding: EdgeInsets.all(14.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(post.author, style: TextStyles.font14BlackMedium),
                Text(
                  timeAgo(post.timestamp),
                  style: TextStyles.font14BlackMedium,
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Text(post.content, style: TextStyles.font14BlackMedium),
            SizedBox(height: 12.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                PostAction(
                  icon: Icons.favorite_border,
                  label: "Like",
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('You liked the post')),
                    );
                  },
                ),
                PostAction(
                  icon: Icons.comment_outlined,
                  label: "Comment",
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Comment feature coming soon'),
                      ),
                    );
                  },
                ),
                PostAction(
                  icon: Icons.share_outlined,
                  label: "Share",
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Shared successfully')),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
