import 'package:onlinetodoshipping/domain_interface/TodoItemRepository.dart';
import 'package:onlinetodoshipping/entity/TodoItemEntity.dart';

class GetTodoItemRepoActionImp implements GetTodoItemsRepoAction {
  GetTodoItemRepoActionImp() {}

  @override
  Future<List<TodoItemEntity>> execute(String todoListId) async {}
}
