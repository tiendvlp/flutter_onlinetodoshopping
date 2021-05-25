import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:onlinetodoshipping/datasource/datamapper/RoomDataMapper.dart';
import 'package:onlinetodoshipping/domain_interface/RoomRepository.dart';
import 'package:onlinetodoshipping/entity/RoomEntity.dart';

class GetAllUserRoomsRepoActionImp implements GetAllUserRoomsRepoAction {
  RoomDataMapper roomDataMapper;

  GetAllUserRoomsRepoActionImp(this.roomDataMapper);

  @override
  Future<List<RoomEntity>> execute(String userEmail) async {
    final firebaseResult = await FirebaseFirestore.instance
        .collection("Room")
        .where("MemberEmails", arrayContains: userEmail)
        .get();

    final List<RoomEntity> result = [];

    if (firebaseResult.size > 0) {
      firebaseResult.docs.forEach((element) {
        result.add(roomDataMapper.fromFirebaseDoc(element.data()));
      });
    }

    return result;
  }
}
