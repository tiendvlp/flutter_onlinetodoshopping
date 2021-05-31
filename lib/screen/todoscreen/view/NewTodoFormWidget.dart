import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'package:onlinetodoshipping/entity/RequestType.dart';
import 'package:onlinetodoshipping/screen/common/BaseWidget.dart';
import 'package:onlinetodoshipping/screen/common/RequestProvider.dart';
import 'package:onlinetodoshipping/screen/common/SizingInformation.dart';
import 'package:onlinetodoshipping/screen/todoscreen/model/TodoScreenState.dart';
import 'package:onlinetodoshipping/screen/todoscreen/view/RequestTypesWidget.dart';
import 'package:onlinetodoshipping/screen/todoscreen/view/SelectedRequestWidget.dart';
import 'package:provider/provider.dart';

class NewTodoFormWidget extends StatefulWidget {
  final double height;
  final double width;
  NewTodoFormWidget(this.height, this.width);
  @override
  _state createState() => _state();
}

class _state extends State<NewTodoFormWidget> {
  final KeyboardVisibilityNotification keyboardVisibilityNotification =
      KeyboardVisibilityNotification();

  bool _isKeyboardVisible = false;
  final RequestProvider _requestProvider = RequestProvider();
  final FocusNode formFocusNode = FocusNode();

  RequestItem _selectedRequest = null;

  void onKeyboardVisibilityChanged(bool isVisible) {
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

  void _onTextChanged(String text) {
    final state = context.read<TodoScreenState>();
    state.saveInputForm(_selectedRequest.type, text);
  }

  TodoScreenState screenState;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    screenState = context.watch();

    if (_selectedRequest == null) {
      _selectedRequest = RequestItem(RequestType.Title);
    }
    keyboardVisibilityNotification.addNewListener(
        onChange: onKeyboardVisibilityChanged);
    return Container(
        height: _isKeyboardVisible
            ? this.widget.height + 70
            : this.widget.height + 40,
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
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Focus(
                      onFocusChange: (isFocused) {
                        screenState.hasFormFocus = isFocused;
                      },
                      child: SelectedRequestWidget(
                        focusNode: formFocusNode,
                        width: size.localWidgetSize.width,
                        request: _selectedRequest,
                        onTextChanged: _onTextChanged,
                      ),
                    ),
                    ..._isKeyboardVisible
                        ? [
                            SizedBox(
                              height: 10,
                            ),
                            RequestTypesWidget(
                              width: size.localWidgetSize.width,
                              height: 30,
                              onRequestSelected: _onRequestSelected,
                            )
                          ]
                        : []
                  ],
                ),
              ),
            );
          },
        ));
  }
}
