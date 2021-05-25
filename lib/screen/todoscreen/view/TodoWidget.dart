import 'package:flutter/material.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'package:onlinetodoshipping/screen/common/BaseWidget.dart';
import 'package:onlinetodoshipping/screen/todoscreen/view/BottomWidget.dart';

class TodoWidget extends StatelessWidget {
  KeyboardVisibilityNotification _keyboardVisibilityNotification =
      KeyboardVisibilityNotification();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: BaseWidget(
        builder: (_, size, platform) {
          return Container(
            height: double.infinity,
            child: Stack(
              children: [
                Container(
                  height: size.localWidgetSize.height,
                  child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (_, index) => Container(
                            margin:
                                EdgeInsets.only(top: 50, left: 20, right: 20),
                            height: 150,
                            width: 50,
                            color: Colors.yellow,
                          )),
                ),
                Positioned(
                    bottom: 0,
                    child: BottomWidget(90, size.localWidgetSize.width))
              ],
            ),
          );
        },
      ),
    );
  }
}
