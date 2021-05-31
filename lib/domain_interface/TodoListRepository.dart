import 'package:onlinetodoshipping/entity/TodoListEntity.dart';

abstract class AddTodoListRepoAction {
  Future<TodoListEntity> execute(String roomId, String title);
}

abstract class GetRoomTodoListRepoAction {
  Future<List<TodoListEntity>> execute(String roomId);
}

abstract class UpdateTodoListTitleRepoAction {
  Future<void> execute(String todoListId, String title);
}
