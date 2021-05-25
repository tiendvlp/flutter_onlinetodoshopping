import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:onlinetodoshipping/domain_interface/UserRepository.dart';

class AddUserRepoActionImp implements AddUserRepoAction {
  @override
  Future<void> execute(String email) async {
    await FirebaseFirestore.instance
        .collection("User")
        .doc(email)
        .set({"Email": email});
  }
}
