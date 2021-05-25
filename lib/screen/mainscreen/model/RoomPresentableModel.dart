import 'package:intl/intl.dart';
import 'package:onlinetodoshipping/entity/RoomEntity.dart';

class RoomPresentableModel implements Comparable<RoomPresentableModel> {
  final String title;
  final String id;
  final DateTime latestUpdate;

  String get lastestUpdatePresentableString {
    final formater = DateFormat("hh:mm on E-dd-M");
    return formater.format(latestUpdate);
  }

  RoomPresentableModel(this.title, this.id, this.latestUpdate);
  static RoomPresentableModel fromEnitty(RoomEntity room) {
    return RoomPresentableModel(room.name, room.id,
        DateTime.fromMillisecondsSinceEpoch(room.lastUpdate));
  }

  @override
  int compareTo(RoomPresentableModel other) {
    if (other.id == id) {
      return 0;
    } else if (other.latestUpdate.millisecondsSinceEpoch >
        latestUpdate.millisecondsSinceEpoch) {
      return 1;
    } else {
      return -1;
    }
  }
}
