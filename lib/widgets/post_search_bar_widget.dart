import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_lite_technical_test/styles/colors/app_colors.dart';
import '../providers/post_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostSearchBar extends StatelessWidget {
  const PostSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PostProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      child: TextField(
        cursorWidth: 2.w,
        cursorHeight: 22.h,
        cursorColor: Colors.black26,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
          hintText: 'Search by author name',
          filled: true,
          fillColor: AppColors.borderColor,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 12.h,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide.none,
          ),
        ),
        onChanged: provider.setFilter,
      ),
    );
  }
}
