import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:onlinetodoshipping/screen/common/BaseWidget.dart';
import 'package:onlinetodoshipping/screen/todoscreen/model/TodoScreenState.dart';
import 'package:onlinetodoshipping/screen/todoscreen/view/NewTodoFormWidget.dart';
import 'package:onlinetodoshipping/screen/todoscreen/view/TitleInputWidget.dart';
import 'package:provider/provider.dart';

class BottomWidget extends StatelessWidget {
  final double maxWidth;
  final double maxHeight;

  BottomWidget(this.maxWidth, this.maxHeight);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        new Positioned(
          top: 0,
          bottom: 0,
          left: 0,
          right: 0,
          child: new ClipRect(
            child: new BackdropFilter(
              filter: new ImageFilter.blur(sigmaX: 8.0, sigmaY: 10.0),
              child: new Container(
                decoration:
                    new BoxDecoration(color: Colors.white.withOpacity(0.90)),
              ),
            ),
          ),
        ),
        Container(
          child: BaseWidget(
            builder: (_, size, platform) {
              TodoScreenState screenState = context.watch();
              if (screenState.isFormVisible) {
                return NewTodoFormWidget(maxHeight, maxWidth);
              } else if (screenState.isTitleInputVisible) {
                return TitleInputWidget(maxWidth, maxHeight * 0.5);
              }
            },
          ),
        ),
      ],
    );
  }
}
