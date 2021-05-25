import 'package:onlinetodoshipping/domain_interface/TodoItemRepository.dart';

enum CreateNewTodoItemResultType { Success, NetworkError, GeneralError }

class CreateNewTodoItemResult {
  final CreateNewTodoItemResultType type;
  CreateNewTodoItemResult(this.type);
}

class CreateNewTodoItemUseCase {
  AddTodoItemRepoAction _addTodoItemRepoAction;

  CreateNewTodoItemUseCase(AddTodoItemRepoAction addTodoItemRepoAction) {
    _addTodoItemRepoAction = addTodoItemRepoAction;
  }

  Future<CreateNewTodoItemResult> execute(String todoId, String title,
      String where, String price, String deadline, String count) async {
    assert(todoId != null || todoId.isNotEmpty,
        'CreateNewTodoItemResult.execute: todoId parameter could not be null or empty');
    assert(title != null || title.isNotEmpty,
        'CreateNewTodoItemResult.execute: title parameter could not be null or empty');

    await _addTodoItemRepoAction.execute(
        todoId, title, where, price, deadline, count);

    return CreateNewTodoItemResult(CreateNewTodoItemResultType.Success);
  }
}
