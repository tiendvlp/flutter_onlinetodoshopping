import 'package:onlinetodoshipping/entity/TodoListEntity.dart';

abstract class AddTodoListRepoAction {
  Future<void> execute(String roomId, String title);
}

abstract class GetRoomTodoListRepoAction {
  Future<List<TodoListEntity>> execute(String roomId);
}
