import 'package:onlinetodoshipping/entity/RoomEntity.dart';
import 'package:onlinetodoshipping/entity/RoomMemberEntity.dart';

class RoomDataMapper {
  RoomEntity fromFirebaseDoc(Map<String, dynamic> firebaseDoc) {
    final mems = List.from(firebaseDoc[("MemberInfo")]);

    final List<RoomMemberEntity> memEntities = [];

    mems.forEach((element) {
      memEntities.add(RoomMemberEntity(element["Email"], element["Nickname"]));
    });

    return RoomEntity(firebaseDoc[("Title")], firebaseDoc["Id"],
        firebaseDoc[("LastUpdate")], memEntities);
  }
}
