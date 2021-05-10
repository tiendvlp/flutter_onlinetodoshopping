import 'package:flutter/material.dart';
import 'package:onlinetodoshipping/screen/common/BaseWidget.dart';
import 'package:onlinetodoshipping/screen/common/ColorSrc.dart';
import 'package:onlinetodoshipping/screen/loginscreen/listener/LoginPageListener.dart';
import 'package:onlinetodoshipping/screen/widget/AppleLoginButton.dart';
import 'package:onlinetodoshipping/screen/widget/GoogleLoginButton.dart';
import 'package:provider/provider.dart';

class LoginMainContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var listener = Provider.of<LoginPageListener>(context);
    return BaseWidget(
      builder: (context, sizingInfo, platformInfo) {
        return Column(
          children: [
            SizedBox(
              width: sizingInfo.screenSize.width * 0.7,
              child: Text(
                "We help you to create and share shopping list in your family",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                    color: ColorSrc.grey1,
                    fontFamily: "OpenSans"),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            platformInfo.isIOS
                ? AppleLoginButton(
                    onPressed: () {
                      listener.onBtnLoginWithApplePressed();
                    },
                    width: sizingInfo.screenSize.width * 0.7,
                    height: 50,
                  )
                : Container(),
            SizedBox(
              height: 20,
            ),
            GoogleLoginButton(
              onPressed: () {
                listener.onBtnLoginWithGooglePressed();
              },
              width: sizingInfo.screenSize.width * 0.7,
              height: 50,
            )
          ],
        );
      },
    );
  }
}
