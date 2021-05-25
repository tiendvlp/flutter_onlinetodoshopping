import 'package:flutter/material.dart';

class BottomWidgetExpand extends StatelessWidget {
  final double height;

  BottomWidgetExpand(this.height);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.height,
      width: double.infinity,
      color: Colors.yellow,
    );
  }
}
