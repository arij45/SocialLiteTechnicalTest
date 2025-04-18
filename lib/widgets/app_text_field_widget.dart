import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_lite_technical_test/styles/colors/app_colors.dart';
import 'package:social_lite_technical_test/styles/fonts/font_styles.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.textEditingController,
    this.onChanged,
    required this.validator,
    required this.title,
    required this.hintText,
    this.onFieldSubmitted,
    this.onPressed,
    this.focusNode,
    this.nextFocusNode,
    this.icon,
    this.textInputAction,
    this.keyboardType,
    this.iconSize,
    required this.obscureText,
  });

  final TextEditingController textEditingController;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final String title;
  final String hintText;
  final void Function(String)? onFieldSubmitted;
  final void Function()? onPressed;
  final IconData? icon;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final double? iconSize;
  final bool obscureText;

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
        TextFormField(
          obscureText: obscureText,
          textInputAction: textInputAction,
          keyboardType: keyboardType,
          autocorrect: true,
          focusNode: focusNode,
          clipBehavior: Clip.antiAlias,
          controller: textEditingController,
          onFieldSubmitted: (value) {
            onFieldSubmitted?.call(value);
            if (nextFocusNode != null) {
              FocusScope.of(context).requestFocus(nextFocusNode);
            }
          },
          onChanged: onChanged,
          validator: validator,
          cursorWidth: 2.w,
          cursorHeight: 22.h,
          cursorColor: Colors.black26,
          style: TextStyles.font16GreyRegular.copyWith(height: 1.5.h,
          ),
          decoration: InputDecoration(
            errorStyle: TextStyles.errorMessage,
            suffixIcon: IconButton(
              onPressed: onPressed,
              icon: Icon(
                icon,
                size: iconSize,
              ),
            ),
            hintText: hintText,
            hintStyle: TextStyles.font16GreyRegular,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                width: 1.w,
                color: AppColors.borderColor,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                width: 1.w,
                color: AppColors.errorColor,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                width: 2.w,
                color: AppColors.errorColor,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                width: 1.w,
                color: AppColors.borderColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                width: 2.w,
                color: AppColors.primaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
