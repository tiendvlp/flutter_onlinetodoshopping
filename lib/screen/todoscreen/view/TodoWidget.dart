import 'package:flutter/material.dart';
import 'package:onlinetodoshipping/screen/common/BaseWidget.dart';
import 'package:onlinetodoshipping/screen/todoscreen/view/ItemTodoTitleWidget.dart';
import 'package:onlinetodoshipping/screen/widget/DismissKeyboardWhenClickOutsideWidget.dart';

import 'BottomWidget.dart';

class TodoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DismissKeyboardWhenClickOutsideWidget(
      child: Container(
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
                        itemBuilder: (_, index) {
                          if (index == 0) {
                            return Container(
                              margin: EdgeInsets.only(
                                top: 40,
                                right: 20,
                              ),
                              child: ItemTodoTitleWidget(),
                            );
                          }
                          return Container(
                            margin: EdgeInsets.only(
                                left: 20, right: 20, bottom: 10),
                            height: 150,
                            width: 50,
                            color: Colors.yellow,
                          );
                        }),
                  ),
                  Positioned(
                      bottom: 0,
                      child: BottomWidget(size.localWidgetSize.width, 90))
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
