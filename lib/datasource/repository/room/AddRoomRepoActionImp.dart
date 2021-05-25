import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:onlinetodoshipping/datasource/firestore/GenerateRoomId.dart';
import 'package:onlinetodoshipping/domain_interface/RoomRepository.dart';
import 'package:onlinetodoshipping/entity/RoomEntity.dart';
import 'package:onlinetodoshipping/entity/RoomMemberEntity.dart';

class AddRoomRepoActionImp implements AddRoomRepoAction {
  GenerateRoomId _generateRoomId;
  AddRoomRepoActionImp() {
    _generateRoomId = GenerateRoomId();
  }
  @override
  Future<RoomEntity> execute(
      String title, RoomMemberEntity memberEntity) async {
    final generatedId = "${await _generateRoomId.getId()}";
    final lastUpdate = DateTime.now().millisecondsSinceEpoch;
    FirebaseFirestore.instance.collection("Room").doc(generatedId).set({
      "Id": generatedId,
      "Title": title,
      "LastUpdate": lastUpdate,
      "MemberEmails": [memberEntity.email],
      "MemberInfo": [
        {"Email": memberEntity.email, "Nickname": memberEntity.nickName}
      ]
    });
    return RoomEntity(title, generatedId, lastUpdate, [memberEntity]);
  }
}
