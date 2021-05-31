import 'package:flutter/material.dart';

class DismissKeyboardWhenClickOutsideWidget extends StatelessWidget {
  final Widget child;
  const DismissKeyboardWhenClickOutsideWidget({this.child});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context)?.unfocus();
      },
      child: child,
    );
  }
}
