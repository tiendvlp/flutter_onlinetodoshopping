import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:onlinetodoshipping/datasource/firestore/GenerateTodoListId.dart';
import 'package:onlinetodoshipping/domain_interface/TodoListRepository.dart';
import 'package:onlinetodoshipping/entity/TodoListEntity.dart';

class AddTodoListRepoActionImp implements AddTodoListRepoAction {
  GenerateTodoListId _generateTodoListId;

  AddTodoListRepoActionImp() {
    _generateTodoListId = GenerateTodoListId();
  }

  @override
  Future<TodoListEntity> execute(String roomId, String title) async {
    int latestUpdate = DateTime.now().millisecondsSinceEpoch;
    final String generatedId = await _generateTodoListId.getId(roomId);
    FirebaseFirestore.instance.collection("TodoList").doc(generatedId).set({
      "Id": generatedId,
      "RoomId": roomId,
      "Title": title,
      "LatestUpdate": latestUpdate,
      "FinishedCount": 0,
      "TotalItem": 0
    });

    return TodoListEntity(title, generatedId, roomId, 0, 0, latestUpdate);
  }
}
