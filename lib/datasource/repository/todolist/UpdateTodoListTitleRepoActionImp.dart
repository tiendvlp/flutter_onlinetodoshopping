import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:onlinetodoshipping/domain_interface/TodoListRepository.dart';
import 'package:onlinetodoshipping/entity/TodoListEntity.dart';

class UpdateTodoListTitleRepoActionImp
    implements UpdateTodoListTitleRepoAction {
  @override
  Future<void> execute(String todoListId, String title) {
    FirebaseFirestore.instance
        .collection("TodoList")
        .doc(todoListId)
        .update({"Title": title});
  }
}
