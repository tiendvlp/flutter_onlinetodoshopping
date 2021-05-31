import 'package:onlinetodoshipping/screen/todoscreen/model/TodoScreenState.dart';
import 'package:onlinetodoshipping/todo_list/CreateTodoListUseCase.dart';
import 'package:onlinetodoshipping/todo_list/UpdateTodoListTitleUseCase.dart';

class TodoController {
  final CreateTodoListUseCase _createTodoListUseCase;
  final UpdateTodoListTitleUseCase _updateTodoListTitleUseCase;
  final TodoScreenState _todoScreenState;

  TodoController(this._createTodoListUseCase, this._todoScreenState,
      this._updateTodoListTitleUseCase);

  Future<void> submitTodoListTitle(String todoTitle) async {
    if (_todoScreenState.todoId != null && _todoScreenState.todoId.isNotEmpty) {
      final UpdateTodoListTitleUseCaseResult result =
          await _updateTodoListTitleUseCase.execute(
              _todoScreenState.todoId, todoTitle);
      if (result.type == UpdateTodoListTitleResultType.Success) {
        _todoScreenState.todoListTitle = todoTitle;
      }
      return;
    }

    CreateTodoListResult result = await _createTodoListUseCase.execute(
        _todoScreenState.roomId, todoTitle);

    if (result.type == CreateTodoListResultType.Success) {
      _todoScreenState.todoListTitle = todoTitle;
      _todoScreenState.todoId = result.createdTodoList.id;
    }
  }
}
