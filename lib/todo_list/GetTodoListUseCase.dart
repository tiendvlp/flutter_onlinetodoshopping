import 'package:onlinetodoshipping/domain_interface/TodoListRepository.dart';

enum GetTodoListResultType { Success, NetworkError, GeneralError }

class GetTodoListResult {
  GetTodoListResultType type;

  GetTodoListResult(this.type);
}

class GetTodoListUseCase {
  GetRoomTodoListRepoAction _getRoomTodoListRepoAction;

  GetTodoListUseCase(GetRoomTodoListRepoAction getRoomTodoListRepoAction) {
    _getRoomTodoListRepoAction = getRoomTodoListRepoAction;
  }

  Future<GetTodoListResult> execute(String roomId) async {
    await _getRoomTodoListRepoAction.execute(roomId);
    return GetTodoListResult(GetTodoListResultType.Success);
  }
}
