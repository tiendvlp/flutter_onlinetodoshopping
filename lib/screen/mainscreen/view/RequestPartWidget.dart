import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onlinetodoshipping/screen/common/BaseWidget.dart';
import 'package:onlinetodoshipping/screen/common/ColorSrc.dart';
import 'package:onlinetodoshipping/screen/widget/MainTopBackGroundWidget.dart';

import 'NotificationWidget.dart';

class RequestPartWidget extends StatelessWidget {
  double height;
  double width;

  RequestPartWidget(this.height, this.width);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: this.height,
        width: this.width,
        child: BaseWidget(builder: (_, size, platform) {
          return Stack(
            children: [
              MainTopBackgroundWidget(
                  height: size.localWidgetSize.height * 0.8),
              SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CupertinoButton(
                        child: Icon(
                          Icons.menu,
                          color: ColorSrc.darkBlue,
                        ),
                        onPressed: () {
                          print("onBtnMenu clcked");
                        }),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Container(
                        child: NotificationWidget(),
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        }));
  }
}
