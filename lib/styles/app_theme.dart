import 'package:flutter/material.dart';
import 'colors/app_colors.dart';
import 'fonts/font_styles.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.backgroundColor,
      primaryColor: AppColors.primaryColor,
      colorScheme: ColorScheme.light(
        primary: AppColors.primaryColor,
        secondary: AppColors.secondary,
        background: AppColors.backgroundColor,
      ),
      textTheme: TextTheme(
        displayLarge: TextStyles.font20BlackBold,
        bodyLarge: TextStyles.font16GreyRegular,
        titleMedium: TextStyles.font14BlackMedium,
      ),
    );
  }
}
