import 'package:onlinetodoshipping/entity/RoomEntity.dart';
import 'package:onlinetodoshipping/entity/RoomMemberEntity.dart';

abstract class AddRoomRepoAction {
  Future<RoomEntity> execute(String title, RoomMemberEntity memberEntity);
}

abstract class GetAllUserRoomsRepoAction {
  Future<List<RoomEntity>> execute(String userEmail);
}

abstract class GetAllRoomUserRepoAction {
  Future<List<RoomMemberEntity>> execute(String roomId);
}
