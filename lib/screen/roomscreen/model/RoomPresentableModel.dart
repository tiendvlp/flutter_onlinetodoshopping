import 'package:intl/intl.dart';
import 'package:onlinetodoshipping/entity/RoomEntity.dart';

class RoomPresentableModel {
  final String title;
  final String id;
  final DateTime latestUpdate;

  String get lastestUpdatePresentableString {
    final formater = DateFormat("hh:mm on E-dd-M");
    return formater.format(latestUpdate);
  }

  RoomPresentableModel(this.title, this.id, this.latestUpdate);
  static RoomPresentableModel fromEnitty(RoomEntity room) {
    return RoomPresentableModel(room.name, room.id, DateTime(room.lastUpdate));
  }
}
