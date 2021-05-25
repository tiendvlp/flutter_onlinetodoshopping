import 'package:onlinetodoshipping/domain_interface/TodoItemRepository.dart';
import 'package:onlinetodoshipping/entity/TodoItemEntity.dart';

enum UpdateTodoItemInfoResultType { Success, NetworkError, GeneralError }

class UpdateTodoItemInfoResult {
  UpdateTodoItemInfoResultType type;

  UpdateTodoItemInfoResult(this.type);
}

class UpdateTodoItemInfoUseCase {
  UpdateTodoItemsRepoAction _updateTodoItemsRepoAction;

  UpdateTodoItemInfoUseCase(
      UpdateTodoItemsRepoAction updateTodoItemsRepoAction) {
    _updateTodoItemsRepoAction = updateTodoItemsRepoAction;
  }

  Future<UpdateTodoItemInfoResult> execute(TodoItemEntity newTodoItem) async {
    await _updateTodoItemsRepoAction.execute(newTodoItem);
    return UpdateTodoItemInfoResult(UpdateTodoItemInfoResultType.Success);
  }
}
