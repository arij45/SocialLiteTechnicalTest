import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_lite_technical_test/controllers/auth_controller.dart';
import 'package:social_lite_technical_test/styles/colors/app_colors.dart';
import 'package:social_lite_technical_test/styles/fonts/font_styles.dart';
import 'package:social_lite_technical_test/widgets/profile_image_picker_widget.dart';

class SettingsCardWidget extends StatelessWidget {
  const SettingsCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();
    final user = authController.currentUser.value;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.w),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: FileImage(File(user?.imageUrl ?? '')),
          ),
          SizedBox(width: 20.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Username: ',
                      style: TextStyles.font14BlackMedium,
                    ),
                    TextSpan(text: user?.username ?? ''),
                  ],
                ),
              ),

              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Title: ',
                      style: TextStyles.font14BlackMedium,
                    ),
                    TextSpan(text: user?.title ?? ''),
                  ],
                ),
              ),

              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Status: ',
                      style: TextStyles.font14BlackMedium,
                    ),
                    TextSpan(text: user?.status ?? ''),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
