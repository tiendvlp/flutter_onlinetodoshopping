import 'package:onlinetodoshipping/domain_interface/TodoItemRepository.dart';

enum RemoveTodoItemResultType { Success, NetworkError, GeneralError }

class RemoveTodoItemResult {
  RemoveTodoItemResultType type;

  RemoveTodoItemResult(this.type);
}

class RemoveTodoItemUseCase {
  RemoveTodoItemRepoAction _removeTodoItemRepoAction;

  RemoveTodoItemUseCase(RemoveTodoItemRepoAction removeTodoItemRepoAction) {
    _removeTodoItemRepoAction = removeTodoItemRepoAction;
  }

  Future<RemoveTodoItemResult> execute(String id) async {
    await _removeTodoItemRepoAction.execute(id);
    return RemoveTodoItemResult(RemoveTodoItemResultType.Success);
  }
}
