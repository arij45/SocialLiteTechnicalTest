import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:social_lite_technical_test/styles/colors/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RowBusinessWidget extends StatelessWidget {
  const RowBusinessWidget({
    super.key,
    this.icon,
    required this.title,
    required this.onTap,
  });

  final IconData? icon;
  final String title;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      child: InkWell(
        onTap: onTap,
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: 48.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  if (icon != null) 
                    Icon(icon, size: 24.sp, color: AppColors.primaryColor),
                  SizedBox(width: 16.w),
                  Text(
                    title,
                    style: TextStyle(
                      color: const Color(0xFF4E5D7B),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 20.sp,
                color: AppColors.primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}