import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:social_lite_technical_test/controllers/auth_controller.dart';
import 'package:social_lite_technical_test/models/user_model.dart';
import 'package:social_lite_technical_test/providers/auth_form_provider.dart';
import 'package:social_lite_technical_test/routes/app_routes.dart';
import 'package:social_lite_technical_test/styles/fonts/font_styles.dart';
import 'package:social_lite_technical_test/utils/constants.dart';
import 'package:social_lite_technical_test/utils/validators.dart';
import 'package:social_lite_technical_test/widgets/app_bar_widget.dart';
import 'package:social_lite_technical_test/widgets/app_button_widget.dart';
import 'package:social_lite_technical_test/widgets/app_drop_down_field_widget.dart';
import 'package:social_lite_technical_test/widgets/app_text_field_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_lite_technical_test/widgets/profile_image_picker_widget.dart';
import 'package:social_lite_technical_test/widgets/terms_add_condition_text_widget.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();
    final currentUser = authController.currentUser.value;
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBarWidget(title: "Hey there, Socialite!"),
      body: Consumer<AuthFormProvider>(
        builder: (context, provider, _) {
          return SingleChildScrollView(
            padding: EdgeInsets.all(16.w),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: ProfileImagePicker(
                      imageUrl: provider.imageUrl,
                      onPickImage: authController.pickImage,
                      onImageSelected: (img) => provider.setImageUrl(img),
                    ),
                  ),
                  if (provider.imageError != null)
                    Padding(
                      padding: EdgeInsets.only(top: 8.h),
                      child: Text(
                        provider.imageError!,
                        style: TextStyles.errorMessage,
                      ),
                    ),
                  SizedBox(height: 13.h),
                  AppTextField(
                    textEditingController: provider.usernameController,
                    title: "Username",
                    hintText: "Enter your Username",
                    onChanged: provider.setUsername,
                    obscureText: false,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Username is required';
                      }
                      return null;
                    },
                  ),
                  
                  SizedBox(height: 13.h),
                  AppTextField(
                    textEditingController: provider.emailController,
                    title: "Email",
                    hintText: "Enter your Email",
                    onChanged: provider.setEmail,
                    obscureText: false,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email is required';
                      } else if (!AppValidators.isValidEmail(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 13.h),
                  AppTextField(
                    textEditingController: provider.titleController,
                    title: "Title",
                    hintText: "Enter your Title",
                    onChanged: provider.setTitle,
                    obscureText: false,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Title is required';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 13.h),
                  AppDropdownField(
                    title: "Status",
                    value: provider.status,
                    onChanged: provider.setStatus,
                    items:
                        AppConstants.statusOptions
                            .map(
                              (status) => DropdownMenuItem(
                                value: status,
                                child: Text(status),
                              ),
                            )
                            .toList(),
                  ),
                  SizedBox(height: 30.h),
                  AppButtonWidget(
                    title: "Update Profile",
                    height: 44.h,
                    width: 340.w,
                    onPressed: () {
                      if (formKey.currentState!.validate() &&
                          provider.validateImage()) {
                        authController.updateUser(
                          username: provider.username,
                          email: provider.email,
                          title: provider.title,
                          status: provider.status,
                          imageUrl: provider.imageUrl,
                        );
                        Get.snackbar("Success", "Profile updated successfully");
                      } else {
                        Get.snackbar("Error", "Please correct all fields");
                      }
                    },
                  ),
                  SizedBox(height: 18.h),
                  Center(child: const TermsAndConditionText()),
                  SizedBox(height: 44.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account? ',
                        style: TextStyles.font12BlackBold,
                      ),
                      InkWell(
                        onTap: () {
                          Get.toNamed(AppRoutes.loginScreen);
                        },
                        child: Text(
                          'Sign In',
                          style: TextStyles.font12BleueBold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
