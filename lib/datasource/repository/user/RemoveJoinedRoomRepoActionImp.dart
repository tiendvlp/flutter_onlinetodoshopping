import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:onlinetodoshipping/domain_interface/UserRepository.dart';

class RemoveJoinedRoomIdRepoActionImp implements RemoveJoinedRoomIdRepoAction {
  @override
  Future<void> execute(String userEmail, String newRoomId) async {
    final result = await FirebaseFirestore.instance
        .collection("User")
        .doc(userEmail)
        .get();
    final List<String> currentJoinedRoom = result.get("JoinedRoom");
    currentJoinedRoom.removeWhere((e) => e == newRoomId);
    FirebaseFirestore.instance.enablePersistence();
    FirebaseFirestore.instance
        .collection("collectionPath")
        .snapshots()
        .listen((event) {});
    await FirebaseFirestore.instance
        .collection("User")
        .doc(userEmail)
        .update({"JoinedRoom": currentJoinedRoom});
  }
}
