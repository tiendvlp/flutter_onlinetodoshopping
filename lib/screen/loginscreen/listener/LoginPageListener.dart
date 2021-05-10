import 'package:flutter/material.dart';

class LoginPageListener {
  final Function() onBtnLoginWithGooglePressed;
  final Function() onBtnLoginWithApplePressed;

  const LoginPageListener(
      {this.onBtnLoginWithGooglePressed, this.onBtnLoginWithApplePressed});
}
