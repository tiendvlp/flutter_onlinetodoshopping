import 'dart:async';

import 'package:onlinetodoshipping/datasource/datamapper/RoomDataMapper.dart';
import 'package:onlinetodoshipping/datasource/repository/room/GetRoomsRepoActionImp.dart';
import 'package:onlinetodoshipping/entity/RoomEntity.dart';
import 'package:onlinetodoshipping/rooms/GetRoomUseCase.dart';
import 'package:onlinetodoshipping/screen/mainscreen/model/MainPageState.dart';
import 'package:onlinetodoshipping/screen/mainscreen/model/RoomPresentableModel.dart';
import 'package:onlinetodoshipping/services/RealtimeRoomService.dart';

class RoomController implements RoomServiceListener {
  GetRoomUseCase _getRoomUseCase;
  MainPageState _mainPageState;

  RoomController(MainPageState mainPageState) {
    _getRoomUseCase =
        GetRoomUseCase(GetAllUserRoomsRepoActionImp(RoomDataMapper()));
    _mainPageState = mainPageState;
    RealtimeRoomService.instance.register(this);
  }

  Future<void> getRooms(String userEmail) async {
    final result = await _getRoomUseCase.execute(userEmail);
    print("GetRoomResult type: ${result.runtimeType}");
    if (result is GetRoomSuccess) {
      // No error
      _mainPageState.loadRoomError = "";
      _mainPageState.addRooms(result.rooms
          .map((e) => RoomPresentableModel(
              e.name, e.id, DateTime.fromMillisecondsSinceEpoch(e.lastUpdate)))
          .toList());
    }
    if (result is GetRoomNetworkError) {
      _mainPageState.loadRoomError =
          "Network error, please check your network connection";
    }
    _mainPageState.loadRoomError = "Couldn't load rooms";
  }

  @override
  void onNewRoomAdded(RoomEntity room) {
    print("New Room Created: ${room.name}");
    _mainPageState.addRooms([RoomPresentableModel.fromEnitty(room)]);
  }

  @override
  void onRoomChanged(RoomEntity room) {}

  @override
  void onRoomRemoved(RoomEntity room) {
    // TODO: implement onRoomRemoved
  }
}
