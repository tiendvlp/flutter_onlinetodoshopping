import 'package:onlinetodoshipping/entity/TodoListEntity.dart';

class TodoListDataMapper {
  TodoListEntity fromFirebaseDoc(Map<String, dynamic> doc) {
    return TodoListEntity(doc["Title"], doc["Id"], doc["RoomId"],
        doc["FinishedCount"], doc["TotalCount"], doc["LatestUpdate"]);
  }
}
