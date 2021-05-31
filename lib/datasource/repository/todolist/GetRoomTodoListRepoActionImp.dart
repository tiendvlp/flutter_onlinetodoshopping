import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:onlinetodoshipping/datasource/datamapper/TodoListDataMapper.dart';
import 'package:onlinetodoshipping/domain_interface/TodoListRepository.dart';
import 'package:onlinetodoshipping/entity/TodoListEntity.dart';

class GetRoomTodoListRepoActionImp implements GetRoomTodoListRepoAction {
  final TodoListDataMapper _todoListDataMapper;

  GetRoomTodoListRepoActionImp(this._todoListDataMapper);

  @override
  Future<List<TodoListEntity>> execute(String roomId) async {
    print("roomId $roomId");
    final docResult = await FirebaseFirestore.instance
        .collection("TodoList")
        .where("RoomId", isEqualTo: roomId)
        .get();
    return docResult.docs.map((doc) {
      return _todoListDataMapper.fromFirebaseDoc(doc.data());
    }).toList();
  }
}
