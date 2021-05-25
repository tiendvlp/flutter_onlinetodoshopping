import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:onlinetodoshipping/domain_interface/UserRepository.dart';

class AddJoinedRoomIdRepoActionImp implements AddJoinedRoomIdRepoAction {
  @override
  Future<void> execute(String userEmail, String newRoomId) async {
    final result = await FirebaseFirestore.instance
        .collection("User")
        .doc(userEmail)
        .get();
    final List currentDocs = result.get("JoinedRoom");
    final List<String> currentJoinedRoom = [];
    currentDocs.forEach((element) {
      currentJoinedRoom.add(element.toString());
    });
    currentJoinedRoom.add(newRoomId);

    await FirebaseFirestore.instance
        .collection("User")
        .doc(userEmail)
        .update({"JoinedRoom": currentJoinedRoom});
  }
}
