import 'package:flutter/material.dart';

class CreateRoomState with ChangeNotifier {
  CreateRoomState _currentState;

  set state(CreateRoomState state) {
    _currentState = state;
    notifyListeners();
  }

  get state => _currentState;
}

class CreateRoomSuccessState extends CreateRoomState {}

class CreateRoomFailedState extends CreateRoomState {}

class LoadingState extends CreateRoomState {}
