import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:onlinetodoshipping/common/Random5digit.dart';

class GenerateRoomId {
  Future<int> getId() async {
    final roomId = Random5digit().random();
    final query = FirebaseFirestore.instance.collection("Room").doc("$roomId");
    var result = await query.get();
    while (result.exists) {
      result = await query.get();
    }
    return roomId;
  }
}
