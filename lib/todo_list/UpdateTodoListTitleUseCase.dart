import 'package:onlinetodoshipping/domain_interface/TodoListRepository.dart';

enum UpdateTodoListTitleResultType { NetworkError, GeneralError, Success }

class UpdateTodoListTitleUseCaseResult {
  final UpdateTodoListTitleResultType type;

  UpdateTodoListTitleUseCaseResult(this.type);
}

class UpdateTodoListTitleUseCase {
  final UpdateTodoListTitleRepoAction _updateTodoListTitleRepoAction;

  UpdateTodoListTitleUseCase(this._updateTodoListTitleRepoAction);

  Future<UpdateTodoListTitleUseCaseResult> execute(
      String todoListId, String title) async {
    _updateTodoListTitleRepoAction.execute(todoListId, title);
    return UpdateTodoListTitleUseCaseResult(
        UpdateTodoListTitleResultType.Success);
  }
}
