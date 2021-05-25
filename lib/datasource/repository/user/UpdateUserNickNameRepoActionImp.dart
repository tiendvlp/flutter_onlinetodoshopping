import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:onlinetodoshipping/domain_interface/UserRepository.dart';

class UpdateUserNickNameRepoActionImp implements UpdateUserNickNameRepoAction {
  @override
  Future<void> execute(String userEmail, String nickName) async {
    await FirebaseFirestore.instance
        .collection("User")
        .doc(userEmail)
        .update({"Nickname": nickName});
  }
}
