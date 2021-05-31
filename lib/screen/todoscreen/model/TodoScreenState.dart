import 'package:flutter/material.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'package:onlinetodoshipping/entity/RequestType.dart';
import 'package:onlinetodoshipping/maintain_userinput/GetAllUserFormInputUseCase.dart';
import 'package:onlinetodoshipping/maintain_userinput/GetSingleUserFormInputUseCase.dart';
import 'package:onlinetodoshipping/maintain_userinput/SaveUserAddTodoFormInputUseCase.dart';

class TodoScreenState with ChangeNotifier {
  Map<String, String> _inputForm = Map();

  final String roomTitle;
  final String roomId;
  String todoId;
  String _todoListTitile;
  final KeyboardVisibilityNotification keyboardVisibilityNotification =
      KeyboardVisibilityNotification();

  bool _isFormVisible = true;
  bool _isTitleInputVisible = false;

  bool get isFormVisible => _isFormVisible;
  bool get isTitleInputVisible => _isTitleInputVisible;

  bool _hasFormFocus = false;
  bool _hasTitleFocus = false;
  bool _isKeyboardVisible = false;

  set hasFormFocus(bool value) {
    _hasFormFocus = value;
    _switchInputMode();
  }

  set hasTitleFocus(bool value) {
    _hasTitleFocus = value;
    _switchInputMode();
  }

  void switchToAddNewTodo() {
    _isFormVisible = true;
  }

  void switchToTitleEditing() {
    _isFormVisible = false;
  }

  Map<String, String> get inputForm => _inputForm;
  final SaveUserAddTodoFormInputUseCase saveUserInputUseCase =
      SaveUserAddTodoFormInputUseCase();
  final GetSingleUserFormInputUseCase getUserInputUseCase =
      GetSingleUserFormInputUseCase();
  final GetAllUserFormInputUseCase getAllUserFormInputUseCase =
      GetAllUserFormInputUseCase();

  TodoScreenState(this.roomId, this.roomTitle, this.todoId) {
    if (todoId != null) {
      Map<String, String> result = getAllUserFormInputUseCase.execute(todoId);
      if (result != null) {
        result.forEach((key, value) {
          if (value != null) {
            _inputForm[key] = value;
          }
        });
      }
    }
    keyboardVisibilityNotification.addNewListener(
      onChange: (isVisible) {
        this._isKeyboardVisible = isVisible;
        _switchInputMode();
      },
    );
  }

  void _switchInputMode() {
    if (_isKeyboardVisible) {
      print("OnKeyboardShowed");
      if (_hasFormFocus) {
        _isFormVisible = true;
        _isTitleInputVisible = false;
        notifyListeners();
        return;
      }
      if (_hasTitleFocus) {
        _isFormVisible = false;
        _isTitleInputVisible = true;
        notifyListeners();
        return;
      }
    } else {
      print("OnKeyboardHide");
      _isFormVisible = true;
      _isTitleInputVisible = false;
      notifyListeners();
    }
  }

  String get todoListTitle => _todoListTitile;
  set todoListTitle(String value) {
    _todoListTitile = value;
    notifyListeners();
  }

  void saveInputForm(RequestType type, String content) {
    String typeName = type.toString().split('.')[1];
    _inputForm[typeName] = content;
    saveUserInputUseCase.execute(todoId, type, content);
  }
}
