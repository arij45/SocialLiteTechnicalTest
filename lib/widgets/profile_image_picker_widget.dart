import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_lite_technical_test/styles/colors/app_colors.dart';
import 'package:social_lite_technical_test/styles/images/app_images.dart';

class ProfileImagePicker extends StatelessWidget {
  final String imageUrl;
  final Future<String?> Function() onPickImage;
  final void Function(String) onImageSelected;

  const ProfileImagePicker({
    super.key,
    required this.imageUrl,
    required this.onPickImage,
    required this.onImageSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 64.r,
          backgroundColor: AppColors.primaryColor,
          backgroundImage: FileImage(File(imageUrl)),
          child:
              imageUrl.isEmpty
                  ? Icon(Icons.person, size: 60.r, color: Colors.white)
                  : null,
        ),
        Positioned(
          bottom: -15.h,
          left: 80.w,
          child: IconButton(
            onPressed: () async {
              final img = await onPickImage();
              if (img != null) {
                onImageSelected(img);
              }
            },
            icon: Icon(
              Icons.add_a_photo,
              color: AppColors.primaryColor,
              size: 20.sp,
            ),
          ),
        ),
      ],
    );
  }
}
