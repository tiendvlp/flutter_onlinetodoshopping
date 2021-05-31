import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onlinetodoshipping/screen/common/BaseWidget.dart';
import 'package:onlinetodoshipping/screen/todoscreen/listeners/TodoScreenListener.dart';
import 'package:onlinetodoshipping/screen/todoscreen/model/TodoScreenState.dart';
import 'package:onlinetodoshipping/screen/widget/FlatTextFieldWidget.dart';
import 'package:provider/provider.dart';

class ItemTodoTitleWidget extends StatefulWidget {
  @override
  _ItemTodoTitleWidgetState createState() => _ItemTodoTitleWidgetState();
}

class _ItemTodoTitleWidgetState extends State<ItemTodoTitleWidget> {
  final TextEditingController _textController = TextEditingController();
  bool enable = false;
  FocusNode focusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
  }

  TodoScreenState screenState;
  @override
  void initState() {
    print("init");
    super.initState();
    focusNode.addListener(() {
      setState(() {
        if (!focusNode.hasFocus) {
          Future.delayed(const Duration(milliseconds: 300), () {
            if (!focusNode.hasFocus) {
              enable = false;
            }
          });
        }
      });
      print("Tien Dang ${focusNode.hasFocus}");
      screenState.hasTitleFocus = focusNode.hasFocus;
    });
  }

  bool isProcessing = false;
  @override
  Widget build(BuildContext context) {
    screenState = context.watch<TodoScreenState>();

    String currentTodoTitle = screenState.todoListTitle;
    bool isEditable =
        (enable || (currentTodoTitle == null || currentTodoTitle.isEmpty));
    if (currentTodoTitle == null || currentTodoTitle.isEmpty) {
      currentTodoTitle = "";
      print("Title still empty");
    } else {
      if (isProcessing) {
        Future.delayed(const Duration(milliseconds: 1000), () {
          if (!focusNode.hasFocus) {
            setState(() {
              isProcessing = false;
            });
          }
        });
      }
    }
    final TextStyle style = TextStyle(
        fontSize: 35,
        color: isProcessing ? Colors.grey[200] : Colors.black,
        fontWeight: FontWeight.bold);
    TodoScreenListener listener = context.read<TodoScreenListener>();
    if (!isProcessing) {
      _textController.text = currentTodoTitle;
    }
    _textController.selection = TextSelection.fromPosition(
        TextPosition(offset: _textController.text.length));
    return BaseWidget(
      builder: (_, size, platform) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: size.screenSize.width - 100,
              child: Stack(
                children: [
                  FlatTextFieldWidget(
                    onChanged: (value) {
                      _textController.selection = TextSelection.fromPosition(
                          TextPosition(offset: _textController.text.length));
                    },
                    focusNode: focusNode,
                    enable: isEditable,
                    action: TextInputAction.done,
                    onSummitted: (value) {
                      if (_textController.text == screenState.todoListTitle) {
                        return;
                      }
                      setState(() {
                        enable = false;
                        isProcessing = true;
                      });
                      listener.onTitleSubmitted(value);
                    },
                    hint: "No Title",
                    controller: _textController,
                    textStyle: style,
                  ),
                ],
              ),
            ),
            ...screenState.todoId != null && screenState.todoId.isNotEmpty
                ? [
                    Container(
                      child: CupertinoButton(
                        padding: EdgeInsets.zero,
                        child: Text(
                          "Edit",
                          style: TextStyle(color: Colors.grey),
                        ),
                        onPressed: () {
                          print("object");
                          setState(() {
                            enable = true;
                          });
                          Future.delayed(const Duration(milliseconds: 300), () {
                            focusNode.requestFocus();
                          });
                        },
                      ),
                    )
                  ]
                : []
          ],
        );
      },
    );
  }
}
