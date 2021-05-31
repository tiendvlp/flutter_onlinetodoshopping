import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:onlinetodoshipping/screen/roomscreen/model/RoomPresentableModel.dart';
import 'package:onlinetodoshipping/screen/roomscreen/model/TodoListPresentableModel.dart';

class RoomScreenState with ChangeNotifier {
  final RoomPresentableModel _currentRoom;
  final SplayTreeSet<TodoListPresentableModel> _todoLists = SplayTreeSet();
  String _errMessage;
  SplayTreeSet<TodoListPresentableModel> get todoLists => _todoLists;
  RoomScreenState(this._currentRoom);

  void addTodoLists(List<TodoListPresentableModel> todoLists) {
    todoLists.forEach((element) {
      _todoLists.add(element);
    });

    notifyListeners();
  }

  String get errMessage => _errMessage;
  set errMessage(String value) {
    _errMessage = value;
    notifyListeners();
  }

  RoomPresentableModel get currentRoom => _currentRoom;
}
