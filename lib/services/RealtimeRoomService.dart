import 'package:onlinetodoshipping/common/BaseObservable.dart';
import 'package:onlinetodoshipping/datasource/realtime/RoomRealtimeImp.dart';
import 'package:onlinetodoshipping/domain_interface/RoomRealtime.dart';
import 'package:onlinetodoshipping/entity/RoomEntity.dart';

abstract class RoomServiceListener {
  void onNewRoomAdded(RoomEntity newRoom);
  void onRoomChanged(RoomEntity newRoom);
  void onRoomRemoved(RoomEntity newRoom);
}

class RealtimeRoomService extends BaseObservable<RoomServiceListener>
    implements RealtimeRoomListener {
  static RealtimeRoomService _instance;
  static RealtimeRoomService get instance => _instance;

  RoomRealtime _realtimeService;

  static void start(String userEmail) {
    _instance = RealtimeRoomService(userEmail);
  }

  static void stop() {
    _instance = null;
  }

  RealtimeRoomService(String userEmail) {
    _realtimeService = RoomRealtimeImp();
    _realtimeService.onChanged(userEmail, this);
  }

  @override
  void onNewRoomAdded(RoomEntity room) {
    listeners.forEach((listener) {
      listener.onNewRoomAdded(room);
    });
  }

  @override
  void onRoomChanged(RoomEntity room) {
    listeners.forEach((listener) {
      listener.onRoomChanged(room);
    });
  }

  @override
  void onRoomRemoved(RoomEntity room) {
    listeners.forEach((listener) {
      listener.onRoomRemoved(room);
    });
  }
}
