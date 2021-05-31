import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:onlinetodoshipping/screen/common/helper/Helper.dart';
import 'package:onlinetodoshipping/screen/todoscreen/controller/TodoController.dart';
import 'package:onlinetodoshipping/screen/todoscreen/listeners/TodoScreenListener.dart';
import 'package:onlinetodoshipping/screen/todoscreen/model/TodoScreenState.dart';
import 'package:onlinetodoshipping/screen/todoscreen/view/TodoWidget.dart';
import 'package:provider/provider.dart';

class TodoScreen extends StatefulWidget {
  String _roomTitle;
  String _roomId;
  String _todoId = "";
  String _todoTitle = "";

  TodoScreen(String roomTitle, String roomId, String todoId) {
    assert(roomId != null && roomId.isNotEmpty, "RoomId could not be null");
    assert(roomTitle != null && roomTitle.isNotEmpty,
        "roomTitle could not be null");
    _roomTitle = roomTitle;
    _roomId = roomId;
    // _todoId = "NewTodo-${_roomId}";
    _todoId = todoId;
  }

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<TodoScreen> implements TodoScreenListener {
  TodoScreenState _state;
  TodoController _todoController;

  @override
  void initState() {
    _state = TodoScreenState(widget._roomId, widget._roomTitle, widget._todoId);
    _todoController = GetIt.instance.get(param1: _state);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => _state),
        Provider(create: (_) {
          return this as TodoScreenListener;
        })
      ],
      child: Scaffold(
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
            title: widget._todoTitle.isNotEmpty
                ? Text(
                    widget._todoTitle,
                    style: TextStyle(color: Colors.black),
                  )
                : null,
            actions: [],
          ),
          body: TodoWidget()),
    );
  }

  @override
  void onTitleSubmitted(String title) {
    print("on title submitted");
    if (title.isEmpty) {
      toast("Title could not empty");
      return;
    }
    _todoController.submitTodoListTitle(title);
  }
}
