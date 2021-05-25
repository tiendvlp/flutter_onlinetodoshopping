import 'package:onlinetodoshipping/domain_interface/TodoListRepository.dart';

enum CreateTodoListResultType { Success, NetworkError, GeneralError }

class CreateTodoListResult {
  final CreateTodoListResultType type;
  CreateTodoListResult(this.type);
}

class CreateTodoListUseCase {
  AddTodoListRepoAction _addTodoListRepoAction;

  CreateTodoListUseCase(AddTodoListRepoAction addTodoListRepoAction) {
    _addTodoListRepoAction = addTodoListRepoAction;
  }

  Future<CreateTodoListResult> execute(roomId, String title) async {
    await _addTodoListRepoAction.execute(roomId, title);
    return CreateTodoListResult(CreateTodoListResultType.Success);
  }
}
