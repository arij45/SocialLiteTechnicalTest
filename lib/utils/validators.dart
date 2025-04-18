import 'package:email_validator/email_validator.dart';

class AppValidators {
  static bool isValidEmail(String email) {
    return EmailValidator.validate(email);
  }

  static bool isValidPassword(String password) {
    return RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,16}$',
    ).hasMatch(password);
  }
}
