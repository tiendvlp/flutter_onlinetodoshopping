import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:onlinetodoshipping/screen/mainscreen/model/RoomPresentableModel.dart';

class MainPageState with ChangeNotifier {
  final SplayTreeSet<RoomPresentableModel> _currentRooms =
      SplayTreeSet((i1, i2) {
    return i1.compareTo(i2);
  });

  RoomPresentableModel _addedRoom = null;
  RoomPresentableModel _changedRoom = null;
  RoomPresentableModel _removedRoom = null;
  String _loadRoomError = "";
  List<RoomPresentableModel> get rooms {
    return [..._currentRooms];
  }

  void addRooms(List<RoomPresentableModel> rooms) {
    rooms.forEach((element) {
      _currentRooms.add(element); //
    });
    print("After add rooms length: ${_currentRooms.length}");
    notifyListeners();
  }

  void removeRooms(List<RoomPresentableModel> targets) {
    targets.forEach((target) {
      _currentRooms.remove(target);
    });
    notifyListeners();
  }

  void modifiedRooms(List<RoomPresentableModel> targets) {
    targets.forEach((target) {
      _currentRooms.remove(target);
      _currentRooms.add(target);
    });
    notifyListeners();
  }

  set loadRoomError(String value) {
    assert(value != null);
    _loadRoomError = value;
    notifyListeners();
  }

  String get loadRoomError {
    return _loadRoomError;
  }
}
