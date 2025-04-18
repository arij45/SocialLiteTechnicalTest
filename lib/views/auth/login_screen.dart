import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
import 'package:social_lite_technical_test/routes/app_routes.dart';
import 'package:social_lite_technical_test/styles/colors/app_colors.dart';
import 'package:social_lite_technical_test/styles/fonts/font_styles.dart';
import 'package:social_lite_technical_test/styles/images/app_images.dart';
import 'package:social_lite_technical_test/widgets/app_bar_widget.dart';
import 'package:social_lite_technical_test/widgets/app_button_widget.dart';
import 'package:social_lite_technical_test/widgets/app_text_field_widget.dart';
import 'package:social_lite_technical_test/widgets/profile_image_picker_widget.dart';
import 'package:social_lite_technical_test/widgets/terms_add_condition_text_widget.dart';
import '../../../controllers/auth_controller.dart';
import '../../../providers/auth_form_provider.dart';
import '../../../utils/validators.dart';
import '../../../utils/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
        appBar: AppBarWidget(title: "Hey there, Socialite!"),
        body: Consumer<AuthFormProvider>(
          builder: (context, provider, _) {
            return SingleChildScrollView(
              padding: EdgeInsets.all(16.w),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 80.h),
                    Center(
                      child: Text(
                        'Successfully Login, Welcome to our Application',
                        textAlign: TextAlign.center,
                        style: TextStyles.font20BlackBold,
                      ),
                    ),
                    SizedBox(height: 28.h),
                    Center(
                      child: Text(
                        'Welcome back! Please enter your details.',
                        textAlign: TextAlign.center,
                        style: TextStyles.font16GreyRegular,
                      ),
                    ),
                    SizedBox(height: 60.h),

                    AppTextField(
                      textEditingController: provider.emailController,
                      title: "Email",
                      hintText: "Enter your Email",
                      obscureText: false,
                      onChanged: provider.setEmail,
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
                    Obx(() {
                      return AppTextField(
                        textEditingController: provider.passwordController,
                        title: "Password",
                        hintText: "Enter your password",
                        icon:
                            authController.isPasswordHidden.value
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                        onPressed:
                            () => authController.isPasswordHidden.toggle(),
                        iconSize: 24.w,
                        obscureText: authController.isPasswordHidden.value,
                        onChanged: provider.setPassword,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password is required';
                          } else if (!AppValidators.isValidPassword(value)) {
                            return 'Use 8–16 chars: A–a–1–!';
                          }
                          return null;
                        },
                      );
                    }),
                    SizedBox(height: 30.h),
                    AppButtonWidget(
                      title: "Sign In",
                      height: 44.h,
                      width: 340.w,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          authController.loginUser(
                            email: provider.email,
                            password: provider.password,
                          );
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
                          'Don’t have an account? ',
                          style: TextStyles.font12BlackBold,
                        ),
                        InkWell(
                          onTap: () {
                            Get.toNamed(AppRoutes.signupScreen);
                          },
                          child: Text(
                            'Sign Up',
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
