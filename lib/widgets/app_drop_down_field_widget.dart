import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:social_lite_technical_test/styles/colors/app_colors.dart';
import 'package:social_lite_technical_test/styles/fonts/font_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDropdownField extends StatelessWidget {
  const AppDropdownField({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
    required this.items,
  });

  final String title;
  final String? value;
  final void Function(String?)? onChanged;
  final List<DropdownMenuItem<String>> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyles.font14BlackMedium,
        ),
        SizedBox(height: 16.h),
        DropdownButtonFormField<String>(
          value: value,
          onChanged: onChanged,
          style: TextStyles.font16GreyRegular,
          icon: Icon(Icons.arrow_drop_down, color: AppColors.primaryColor),
          dropdownColor: Colors.white,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                color: AppColors.borderColor,
                width: 1.w,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                color: AppColors.borderColor,
                width: 1.w,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                color: AppColors.primaryColor,
                width: 2.w,
              ),
            ),
          ),
          items: items,
        ),
      ],
    );
  }
}
