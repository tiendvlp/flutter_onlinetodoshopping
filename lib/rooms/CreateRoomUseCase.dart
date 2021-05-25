import 'package:get_it/get_it.dart';
import 'package:onlinetodoshipping/domain_interface/RoomRepository.dart';
import 'package:onlinetodoshipping/domain_interface/UserRepository.dart';
import 'package:onlinetodoshipping/entity/RoomMemberEntity.dart';

enum CreateRoomResultType { Success, NetworkError, GeneralError }

class CreateRoomResult {
  CreateRoomResultType type;

  CreateRoomResult(this.type);
}

class CreateRoomUseCase {
  AddRoomRepoAction _addRoomRepoAction;
  AddJoinedRoomIdRepoAction _addJoinedRoomIdRepoAction;

  CreateRoomUseCase(AddRoomRepoAction addRoomRepoAction,
      AddJoinedRoomIdRepoAction addJoinedRoomIdRepoAction) {
    _addRoomRepoAction = addRoomRepoAction;
    _addJoinedRoomIdRepoAction = addJoinedRoomIdRepoAction;
  }

  Future<CreateRoomResult> execute(
      String title, RoomMemberEntity firstMember) async {
    final newRoom = await _addRoomRepoAction.execute(title, firstMember);
    await _addJoinedRoomIdRepoAction.execute(firstMember.email, newRoom.id);
    return CreateRoomResult(CreateRoomResultType.Success);
  }
}
