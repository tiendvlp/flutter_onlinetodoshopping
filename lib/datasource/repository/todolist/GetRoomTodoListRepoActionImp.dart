import 'package:onlinetodoshipping/domain_interface/TodoListRepository.dart';
import 'package:onlinetodoshipping/entity/TodoListEntity.dart';

class GetRoomTodoListRepoActionImp implements GetRoomTodoListRepoAction {
  @override
  Future<List<TodoListEntity>> execute(String roomId) async {}
}
