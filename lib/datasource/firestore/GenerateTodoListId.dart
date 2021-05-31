import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:onlinetodoshipping/common/Random5digit.dart';

class GenerateTodoListId {
  Future<String> getId(String roomId) async {
    final generatedId = Random5digit().random();
    final query = FirebaseFirestore.instance
        .collection("TodoList")
        .doc("$roomId.$generatedId");
    var result = await query.get();
    while (result.exists) {
      result = await query.get();
    }
    return "$roomId.$generatedId";
  }
}
