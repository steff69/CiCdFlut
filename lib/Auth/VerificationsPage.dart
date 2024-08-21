import 'package:flutter/material.dart';
import 'package:fudly/constants/constants.dart';
import 'package:phone_otp_verification/phone_verification.dart';

class VerificationsPage extends StatelessWidget {
  const VerificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PhoneVerification(
      isFirstPage: false,
      enableLogo: false,
      themeColor: kPrimary,
      backgroundColor: kLightwhite,
      initialPageText: "Verify Phone Number",
      initialPageTextStyle: const TextStyle(
        color: kPrimary,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      textColor: kDark,
      onSend: (String value) {
        print('Phone number: $value');
      },
      onVerification: (String value) {
        print('OTP: $value');
      },
    );
    ;
  }
}
