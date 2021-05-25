import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:onlinetodoshipping/datasource/datamapper/RoomDataMapper.dart';
import 'package:onlinetodoshipping/domain_interface/RoomRealtime.dart';

class RoomRealtimeImp implements RoomRealtime {
  RoomDataMapper _roomDataMapper;

  RoomRealtimeImp() {
    _roomDataMapper = RoomDataMapper();
  }

  Future<bool> onChanged(
      String userEmail, RealtimeRoomListener listener) async {
    FirebaseFirestore.instance
        .collection("Room")
        .where("LastUpdate",
            isGreaterThanOrEqualTo: DateTime.now().millisecondsSinceEpoch)
        .orderBy("LastUpdate", descending: true)
        .where("MemberEmails", arrayContains: userEmail)
        .snapshots()
        .listen((event) {
      event.docChanges.forEach((docChange) {
        switch (docChange.type) {
          case DocumentChangeType.added:
            listener.onNewRoomAdded(
                _roomDataMapper.fromFirebaseDoc(docChange.doc.data()));
            break;
          case DocumentChangeType.modified:
            listener.onRoomChanged(
                _roomDataMapper.fromFirebaseDoc(docChange.doc.data()));
            break;
          case DocumentChangeType.removed:
            listener.onRoomRemoved(
                _roomDataMapper.fromFirebaseDoc(docChange.doc.data()));
            break;
        }
      });
    });
    return true;
  }
}
