import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:onlinetodoshipping/domain_interface/UserRepository.dart';
import 'package:onlinetodoshipping/entity/UserEntity.dart';

class GetUserRepoActionImp implements GetUserRepoAction {
  Future<UserEntity> execute(String userEmail) async {
    final result = await FirebaseFirestore.instance
        .collection("User")
        .doc(userEmail)
        .get();

    final lastestNickname = result.data().containsKey("LatestNickname")
        ? result.data()["LatestNickname"]
        : "";

    print("${result.get("JoinedRoom") as List<dynamic>}");
    final List<String> joinedRoom = [];

    if (result.data().containsKey("JoinedRoom")) {
      final List<dynamic> joinedRoomDoc = result.get("JoinedRoom");
      joinedRoomDoc.forEach((element) {
        joinedRoom.add(element.toString());
      });
    }

    return UserEntity(result.get("Email"), lastestNickname, joinedRoom);
  }
}
//asdas
//as dasdasd
// asdasd
