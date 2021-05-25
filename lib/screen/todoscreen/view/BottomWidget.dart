import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'package:onlinetodoshipping/screen/common/BaseWidget.dart';
import 'package:onlinetodoshipping/screen/common/RequestProvider.dart';
import 'package:onlinetodoshipping/screen/common/SizingInformation.dart';
import 'package:onlinetodoshipping/screen/todoscreen/view/RequestTypesWidget.dart';
import 'package:onlinetodoshipping/screen/todoscreen/view/SelectedRequestWidget.dart';

class BottomWidget extends StatefulWidget {
  final double height;
  final double width;
  BottomWidget(this.height, this.width);

  @override
  _BottomWidgetState createState() => _BottomWidgetState();
}

class _BottomWidgetState extends State<BottomWidget> {
  final KeyboardVisibilityNotification keyboardVisibilityNotification =
      KeyboardVisibilityNotification();

  bool _isKeyboardVisible = false;
  RequestProvider _requestProvider = RequestProvider();

  RequestItem _selectedRequest = null;

  void onKeyboardVisibilityChanged(bool isVisible) {
    print(isVisible);
    setState(() {
      _isKeyboardVisible = isVisible;
      if (!isVisible) {
        setState(() {
          _selectedRequest = null;
        });
      }
    });
  }

  void _onRequestSelected(RequestItem selectedRequest) {
    setState(() {
      _selectedRequest = selectedRequest;
    });
  }

  @override
  Widget build(BuildContext context) {
    keyboardVisibilityNotification.addNewListener(
        onChange: onKeyboardVisibilityChanged);
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
                    new BoxDecoration(color: Colors.white.withOpacity(0.95)),
              ),
            ),
          ),
        ),
        Container(
            height: _isKeyboardVisible
                ? this.widget.height + 60
                : this.widget.height + 5,
            width: this.widget.width,
            child: BaseWidget(
              builder: (_, size, platform) {
                return Padding(
                  padding: EdgeInsets.only(
                      top: 10,
                      bottom: _isKeyboardVisible
                          ? 10
                          : (size.aspectRatioType == AspectRatioType.LONG)
                              ? 30
                              : 0),
                  child: Stack(
                    children: [
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SelectedRequestWidget(
                              width: size.localWidgetSize.width,
                              request: _selectedRequest,
                            ),
                            ..._isKeyboardVisible
                                ? [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    RequestTypesWidget(
                                      width: size.localWidgetSize.width,
                                      height: 40,
                                      onRequestSelected: _onRequestSelected,
                                    )
                                  ]
                                : []
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            )),
      ],
    );
  }
}
