import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onlinetodoshipping/screen/common/BaseWidget.dart';

class AppleLoginButton extends StatelessWidget {
  final double width;
  final double height;
  final Function onPressed;

  AppleLoginButton(
      {@required this.width, @required this.height, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: this.onPressed,
      child: Container(
        width: this.width,
        height: this.height,
        child: BaseWidget(
          builder: (context, sizingInfo, platformInfo) {
            final localHeight = sizingInfo.localWidgetSize.height;
            return Container(
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      height: localHeight * 0.45,
                      child: Image.asset("assets/image/icon_apple.png")),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Login With Apple ID",
                    style: TextStyle(
                        fontFamily: "OpenSans",
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: localHeight * 0.35),
                  ),
                ],
              )),
            );
          },
        ),
      ),
    );
  }
}
