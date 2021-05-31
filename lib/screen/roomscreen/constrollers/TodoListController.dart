import 'package:onlinetodoshipping/screen/roomscreen/model/RoomScreenState.dart';
import 'package:onlinetodoshipping/screen/roomscreen/model/TodoListPresentableModel.dart';
import 'package:onlinetodoshipping/todo_list/GetTodoListUseCase.dart';

class TodoListController {
  final GetTodoListUseCase _getTodoListUseCase;
  final RoomScreenState _state;

  TodoListController(this._getTodoListUseCase, this._state);

  Future<void> getTodoList() async {
    final GetTodoListResult result =
        await _getTodoListUseCase.execute(_state.currentRoom.id);

    if (result.type == GetTodoListResultType.Success) {
      _state.addTodoLists(result.todoLists.map((e) {
        return TodoListPresentableModel(
            e.title, e.id, e.finishedCount, e.totalItems, e.latestUpdate);
      }).toList());
    }
    if (result.type == GetTodoListResultType.GeneralError) {
      _state.errMessage = "General error occurs";
    }
    if (result.type == GetTodoListResultType.NetworkError) {
      _state.errMessage = "Network error";
    }
  }
}
