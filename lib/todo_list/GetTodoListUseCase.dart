import 'package:onlinetodoshipping/domain_interface/TodoListRepository.dart';
import 'package:onlinetodoshipping/entity/TodoListEntity.dart';

enum GetTodoListResultType { Success, NetworkError, GeneralError }

class GetTodoListResult {
  GetTodoListResultType type;
  List<TodoListEntity> todoLists = [];
  GetTodoListResult(this.type);
}

class GetTodoListUseCase {
  GetRoomTodoListRepoAction _getRoomTodoListRepoAction;

  GetTodoListUseCase(GetRoomTodoListRepoAction getRoomTodoListRepoAction) {
    _getRoomTodoListRepoAction = getRoomTodoListRepoAction;
  }

  Future<GetTodoListResult> execute(String roomId) async {
    final successResult = GetTodoListResult(GetTodoListResultType.Success);
    successResult.todoLists
        .addAll(await _getRoomTodoListRepoAction.execute(roomId));
    return successResult;
  }
}
