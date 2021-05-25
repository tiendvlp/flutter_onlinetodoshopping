import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onlinetodoshipping/screen/common/BaseWidget.dart';
import 'package:onlinetodoshipping/screen/common/ColorSrc.dart';

class NotificationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseWidget(builder: (context, size, platformInfo) {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Notification",
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    fontFamily: "GilSans",
                    color: ColorSrc.darkBlue),
              ),
              CupertinoButton(
                  child: Text('clear',
                      style: TextStyle(
                        color: ColorSrc.grey1,
                      )),
                  onPressed: () {
                    print('onBtnClearNotification pressed');
                  })
            ],
          ),
        ],
      );
    });
  }
}
