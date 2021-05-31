import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onlinetodoshipping/screen/common/AspectRatio.dart';
import 'package:onlinetodoshipping/screen/common/BaseWidget.dart';
import 'package:onlinetodoshipping/screen/common/ColorSrc.dart';
import 'package:onlinetodoshipping/screen/common/SizingInformation.dart';
import 'package:onlinetodoshipping/screen/mainscreen/view/RequestPartWidget.dart';
import 'package:onlinetodoshipping/screen/mainscreen/view/RoomPartWidget.dart';

class MainPageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      builder: (_, size, platform) {
        return Scaffold(
            backgroundColor: ColorSrc.pink3,
            body: Container(
              height: size.screenSize.height,
              alignment: Alignment.bottomCenter,
              child: Column(
                children: [
                  RequestPartWidget(
                      size.localWidgetSize.height * 0.4, double.infinity),
                  RoomPartWidget(
                      size.localWidgetSize.height * 0.6, double.infinity)
                ],
              ),
            ));
      },
    );
  }
}
