import 'package:onlinetodoshipping/entity/RoomEntity.dart';

abstract class RealtimeRoomListener {
  void onNewRoomAdded(RoomEntity room);
  void onRoomChanged(RoomEntity room);
  void onRoomRemoved(RoomEntity room);
}

abstract class RoomRealtime {
  Future<bool> onChanged(String userEmail, RealtimeRoomListener listener);
}
