import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:social_lite_technical_test/models/user_model.dart';
import 'package:social_lite_technical_test/utils/validators.dart';

import 'package:flutter/material.dart';
import '../models/user_model.dart';

class AuthFormProvider with ChangeNotifier {
  final TextEditingController usernameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final TextEditingController titleController;

  String _status;
  String _imageUrl;
  String? imageError;

  AuthFormProvider({UserModel? user})
    : usernameController = TextEditingController(text: user?.username ?? ''),
      emailController = TextEditingController(text: user?.email ?? ''),
      passwordController = TextEditingController(text: user?.password ?? ''),
      confirmPasswordController = TextEditingController(
        text: user?.password ?? '',
      ),
      titleController = TextEditingController(text: user?.title ?? ''),
      _status = user?.status ?? 'offline',
      _imageUrl = user?.imageUrl ?? '';

  String get username => usernameController.text;
  String get email => emailController.text;
  String get password => passwordController.text;
  String get confirmPassword => confirmPasswordController.text;
  String get title => titleController.text;
  String get status => _status;
  String get imageUrl => _imageUrl;

  void setUsername(String value) {
    usernameController.text = value;
    notifyListeners();
  }

  void setEmail(String value) {
    emailController.text = value;
    notifyListeners();
  }

  void setPassword(String value) {
    passwordController.text = value;
    notifyListeners();
  }

  void setConfirmPassword(String value) {
    confirmPasswordController.text = value;
    notifyListeners();
  }

  void setTitle(String value) {
    titleController.text = value;
    notifyListeners();
  }

  void setStatus(String? value) {
    if (value != null) {
      _status = value;
      notifyListeners();
    }
  }

  void setImageUrl(String value) {
    _imageUrl = value;
    notifyListeners();
  }

  bool validateImage() {
    if (_imageUrl.isEmpty) {
      imageError = 'Profile image is required';
      notifyListeners();
      return false;
    }
    imageError = null;
    notifyListeners();
    return true;
  }

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    titleController.dispose();
    super.dispose();
  }
}
