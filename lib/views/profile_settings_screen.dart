import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_lite_technical_test/controllers/auth_controller.dart';
import 'package:social_lite_technical_test/controllers/theme_controller.dart';
import 'package:social_lite_technical_test/routes/app_routes.dart';
import 'package:social_lite_technical_test/styles/colors/app_colors.dart';
import 'package:social_lite_technical_test/styles/fonts/font_styles.dart';
import 'package:social_lite_technical_test/widgets/row_business_widget.dart';
import 'package:social_lite_technical_test/widgets/settings_card_widget.dart';
import 'package:get/get.dart';
import 'package:social_lite_technical_test/widgets/toggle_button_widget.dart';

class ProfileSettingsScreen extends StatelessWidget {
  const ProfileSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();
    final themeController = Get.find<ThemeController>();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24.h),
              Center(child: Text('Profile', style: TextStyles.font16BleueBold)),
              SizedBox(height: 24.h),
              const SettingsCardWidget(),
              SizedBox(height: 24.h),
              const Divider(thickness: 0.4),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 18.h),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.settings, color: AppColors.primaryColor),

                        Text(
                          'Light Mode',
                          style: TextStyle(
                            color: const Color(0xFF4E5D7B),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Obx(
                          () => Switch(
                            value: themeController.isDarkMode.value,
                            onChanged: (_) => themeController.toggleTheme(),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 16.h),
                    RowBusinessWidget(
                      icon: Icons.person,
                      title: 'Profile Details',
                      onTap: () => Get.toNamed(AppRoutes.updateProfileScreen),
                    ),
                    SizedBox(height: 16.h),
                    RowBusinessWidget(
                      icon: Icons.logout,
                      title: 'Logout',
                      onTap: authController.logout,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
