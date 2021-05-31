import 'package:onlinetodoshipping/entity/RequestType.dart';
import 'package:onlinetodoshipping/entity/RequestEntity.dart';

abstract class CreateNewRequestRepoAction {
  Future<void> execute(String roomId, String roomName, String todoId,
      String todoTitle, RequestType question);
}

abstract class RemoveRequestRepoAction {
  Future<void> execute(String id);
}

abstract class RemoveAllRequestRepoAction {
  Future<void> execute(String userEmail);
}

abstract class RemoveTodoRequestRepoAction {
  Future<void> execute(String todoId);
}

abstract class RemoveAllRoomRequestRepoAction {
  Future<void> execute(String roomId);
}

abstract class GetAllRequestRepoAction {
  Future<List<RequestEntity>> execute(String userEmail);
}

abstract class GetTodoRequestRepoAction {
  Future<List<RequestEntity>> execute(String todoId);
}

abstract class GetRoomRequestRepoAction {
  Future<List<RequestEntity>> execute(String roomId);
}

abstract class AnswerRequestRepoAction {
  Future<void> execute(String requestId, String answer);
}
