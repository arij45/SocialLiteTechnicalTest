import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:social_lite_technical_test/controllers/theme_controller.dart';
import 'package:social_lite_technical_test/styles/colors/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ToggleButtonWidget extends StatelessWidget {
  const ToggleButtonWidget({super.key, required bool isActive});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: 36.w,
      height: 20.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.r),
        color:
            themeController.isDarkMode.value
                ? AppColors.primaryColor
                : AppColors.borderColor,
      ),
      child: AnimatedAlign(
        duration: const Duration(milliseconds: 300),
        alignment:
            themeController.isDarkMode.value
                ? Alignment.centerRight
                : Alignment.centerLeft,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.w),
          child: Container(
            width: 16.w,
            height: 16.h,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
