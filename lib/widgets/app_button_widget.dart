
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_lite_technical_test/styles/colors/app_colors.dart';
import 'package:social_lite_technical_test/styles/fonts/font_styles.dart';

class AppButtonWidget extends StatelessWidget {
  AppButtonWidget({
    super.key,
    required this.title,
    required this.onPressed,
    this.color = AppColors.primaryColor,
    required this.height ,
    required this.width ,
  });
  final String title;
  final void Function()? onPressed;
  final Color color;
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyles.font16WhiteSemiBold,
          ),
        ),
    );
  }
}
