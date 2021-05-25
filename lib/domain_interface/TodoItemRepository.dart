import 'package:onlinetodoshipping/entity/TodoItemEntity.dart';

abstract class AddTodoItemRepoAction {
  Future<void> execute(String todoListId, String title, String where,
      String price, String deadline, String count);
}

abstract class GetTodoItemsRepoAction {
  Future<List<TodoItemEntity>> execute(String todoListId);
}

abstract class UpdateTodoItemsRepoAction {
  Future<void> execute(TodoItemEntity newTodoItem);
}

abstract class UpdateTodoItemDoneStateRepoAction {
  Future<void> execute(String todoItemId, String finisherEmail);
}

abstract class RemoveTodoItemRepoAction {
  Future<void> execute(String id);
}
