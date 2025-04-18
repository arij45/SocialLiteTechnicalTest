import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_lite_technical_test/styles/colors/app_colors.dart';

class PostAction extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const PostAction({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(4.r),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        child: Row(
          children: [
            Icon(icon, size: 18.sp, color: AppColors.hinText),
            SizedBox(width: 6.w),
            Text(
              label,
              style: TextStyle(fontSize: 13.sp, color: AppColors.titleColor),
            ),
          ],
        ),
      ),
    );
  }
}
