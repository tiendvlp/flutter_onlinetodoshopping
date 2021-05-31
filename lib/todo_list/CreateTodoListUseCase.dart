import 'package:onlinetodoshipping/domain_interface/TodoListRepository.dart';
import 'package:onlinetodoshipping/entity/TodoListEntity.dart';

enum CreateTodoListResultType { Success, NetworkError, GeneralError }

class CreateTodoListResult {
  final CreateTodoListResultType type;
  final TodoListEntity createdTodoList;

  CreateTodoListResult(this.type, this.createdTodoList);
}

class CreateTodoListUseCase {
  AddTodoListRepoAction _addTodoListRepoAction;

  CreateTodoListUseCase(AddTodoListRepoAction addTodoListRepoAction) {
    _addTodoListRepoAction = addTodoListRepoAction;
  }

  Future<CreateTodoListResult> execute(roomId, String title) async {
    TodoListEntity createdTodoList =
        await _addTodoListRepoAction.execute(roomId, title);
    return CreateTodoListResult(
        CreateTodoListResultType.Success, createdTodoList);
  }
}
