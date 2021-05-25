import 'package:onlinetodoshipping/domain_interface/RoomRepository.dart';
import 'package:onlinetodoshipping/entity/RoomEntity.dart';

abstract class GetRoomResult {}

class GetRoomSuccess extends GetRoomResult {
  final List<RoomEntity> rooms;

  GetRoomSuccess(this.rooms);
}

class GetRoomNetworkError extends GetRoomResult {}

class GetRoomGeneralError extends GetRoomResult {}

class GetRoomUseCase {
  GetAllUserRoomsRepoAction _getRoomsRepoAction;

  GetRoomUseCase(
    GetAllUserRoomsRepoAction getRoomsRepoAction,
  ) {
    _getRoomsRepoAction = getRoomsRepoAction;
  }

  Future<GetRoomResult> execute(String userEmail) async {
    return GetRoomSuccess(await _getRoomsRepoAction.execute(userEmail));
  }
}
