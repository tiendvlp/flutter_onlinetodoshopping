import 'package:flutter/material.dart';
import 'package:onlinetodoshipping/screen/applicationstate/User.dart';

class ApplicationState with ChangeNotifier {
  User _user;

  set user(User user) {
    _user = user;
    notifyListeners();
  }

  get user {
    return _user;
  }
}
