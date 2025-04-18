import 'package:flutter/material.dart';
import 'package:social_lite_technical_test/styles/fonts/font_styles.dart';

class TermsAndConditionText extends StatelessWidget {
  const TermsAndConditionText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: 'iBus ', style: TextStyles.font12BlackBold),
          TextSpan(text: 'Terms', style: TextStyles.font12BleueBold),
          TextSpan(text: ' and ', style: TextStyles.font12BlackBold),
          TextSpan(text: 'Privacy Policy', style: TextStyles.font12BleueBold),
          TextSpan(text: ' apply', style: TextStyles.font12BlackBold),
        ],
      ),
    );
  }
}
