import 'package:onlinetodoshipping/domain_interface/TodoItemRepository.dart';
import 'package:onlinetodoshipping/entity/TodoItemEntity.dart';

enum GetAllTodoItemUseCaseResultType { Success, NetworkError, GeneralError }

class GetAllTodoItemUseCaseResult {
  final GetAllTodoItemUseCaseResultType type;
  GetAllTodoItemUseCaseResult(this.type);
}

class GetAllTodoItemSuccess extends GetAllTodoItemUseCaseResult {
  List<TodoItemEntity> result;

  GetAllTodoItemSuccess(GetAllTodoItemUseCaseResultType type, this.result)
      : super(type);
}

class GetAllTodoItemUseCase {
  GetTodoItemsRepoAction _getTodoItemsRepoAction;

  GetAllTodoItemUseCase(GetTodoItemsRepoAction getTodoItemsRepoAction) {
    _getTodoItemsRepoAction = getTodoItemsRepoAction;
  }

  Future<GetAllTodoItemUseCaseResult> execute(String todoListId) async {
    return GetAllTodoItemSuccess(GetAllTodoItemUseCaseResultType.Success,
        await _getTodoItemsRepoAction.execute(todoListId));
  }
}
