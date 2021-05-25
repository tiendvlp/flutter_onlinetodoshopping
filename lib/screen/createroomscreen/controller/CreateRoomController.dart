import 'package:onlinetodoshipping/datasource/repository/room/AddRoomRepoActionImp.dart';
import 'package:onlinetodoshipping/datasource/repository/user/AddJoinedRoomIdRepoActionImp.dart';
import 'package:onlinetodoshipping/entity/RoomMemberEntity.dart';
import 'package:onlinetodoshipping/rooms/CreateRoomUseCase.dart';
import 'package:onlinetodoshipping/screen/applicationstate/ApplicationState.dart';

enum CreateRoomResult { Success, Failed }

class CreateRoomController {
  CreateRoomUseCase _createRoomUseCase;
  ApplicationState _applicationState;
  CreateRoomController(ApplicationState applicationState) {
    _applicationState = applicationState;
    _createRoomUseCase = CreateRoomUseCase(
        AddRoomRepoActionImp(), AddJoinedRoomIdRepoActionImp());
  }

  Future<CreateRoomResult> createRoom(String nickName, String roomName) async {
    assert(
        nickName != null && nickName.isNotEmpty, 'nickName could not be nulll');
    assert(
        roomName != null && roomName.isNotEmpty, 'roomName could not be nulll');

    final result = await _createRoomUseCase.execute(
        roomName, RoomMemberEntity(nickName, _applicationState.user.email));

    switch (result.type) {
      case CreateRoomResultType.Success:
        return CreateRoomResult.Success;
        break;
      case CreateRoomResultType.NetworkError:
        return CreateRoomResult.Failed;
        break;
      case CreateRoomResultType.GeneralError:
        return CreateRoomResult.Failed;
        break;
    }
    return CreateRoomResult.Failed;
  }
}
