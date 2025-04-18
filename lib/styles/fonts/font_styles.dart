import 'package:flutter/material.dart';
import 'package:social_lite_technical_test/styles/colors/app_colors.dart';
import 'package:social_lite_technical_test/styles/fonts/font_family_helper.dart';
import 'package:social_lite_technical_test/styles/fonts/font_weight_helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles {
 
  static TextStyle font12BlackBold = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.regular,
    color: AppColors.boldText,
    fontFamily: FontFamilyHelper.fontFamily1,
  );

  static TextStyle font12BleueBold = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.regular,
    color: AppColors.primaryColor,
    fontFamily: FontFamilyHelper.fontFamily1,
  );

  static TextStyle font16BleueBold = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.bold,
    color: AppColors.primaryColor,
    fontFamily: FontFamilyHelper.fontFamily1,
  );

  static TextStyle font16WhiteSemiBold = TextStyle(
    fontSize: 16.sp,
    color: AppColors.backgroundColor,
    fontWeight: FontWeightHelper.semiBold,
  );

  static TextStyle font20BlackBold = TextStyle(
    color: AppColors.boldText,
    fontSize: 20.sp,
    fontFamily: FontFamilyHelper.fontFamily1,
    fontWeight: FontWeightHelper.bold,
  );
  static TextStyle font16GreyRegular = TextStyle(
    color: AppColors.hinText,
    fontSize: 16.sp,
    fontFamily: FontFamilyHelper.fontFamily1,
    fontWeight: FontWeightHelper.regular,
  );
  static TextStyle font14BlackMedium = TextStyle(
    color: AppColors.textField,
    fontSize: 14.sp,
    fontFamily: FontFamilyHelper.fontFamily1,
    fontWeight: FontWeightHelper.medium,
  );

  static TextStyle errorMessage = TextStyle(
    color: AppColors.errorColor,
    fontSize: 12.sp,
    fontFamily: FontFamilyHelper.fontFamily1,
    fontWeight: FontWeightHelper.bold,
  );

}
