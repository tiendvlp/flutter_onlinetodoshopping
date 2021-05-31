import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TitleInputWidget extends StatelessWidget {
  final double width;
  final double height;

  const TitleInputWidget(this.width, this.height);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
      alignment: Alignment.centerRight,
      width: this.width,
      height: this.height,
      child: CupertinoButton(
        color: Colors.grey[200],
        padding: EdgeInsets.only(left: 8, right: 8),
        onPressed: () {
          FocusScope.of(context).unfocus();
        },
        minSize: 32,
        borderRadius: BorderRadius.all(Radius.circular(5)),
        child: Text(
          "Cancel",
          style: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}
