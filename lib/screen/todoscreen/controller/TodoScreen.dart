import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onlinetodoshipping/screen/common/BaseWidget.dart';
import 'package:onlinetodoshipping/screen/todoscreen/view/BottomWidget.dart';
import 'package:onlinetodoshipping/screen/todoscreen/view/TodoWidget.dart';

class TodoScreen extends StatefulWidget {
  String _roomTitle;
  String _roomId;
  TodoScreen(String roomTitle, String roomId) {
    _roomTitle = roomTitle;
    _roomId = roomId;
  }

  @override
  State<StatefulWidget> createState() {
    return _TodoScreenState();
  }
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          shadowColor: Colors.transparent,
          leading: CupertinoButton(
              padding: EdgeInsets.only(left: 30),
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.grey,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              }),
          title: Text(
            widget._roomTitle,
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            CupertinoButton(
                padding: EdgeInsets.only(right: 30),
                child: Text(
                  "Save",
                  style: TextStyle(color: Colors.blue),
                ),
                onPressed: () {})
          ],
        ),
        body: TodoWidget());
  }
}
