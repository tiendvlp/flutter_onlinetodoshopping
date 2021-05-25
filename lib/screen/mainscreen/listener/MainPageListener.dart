import 'package:onlinetodoshipping/screen/mainscreen/model/RoomPresentableModel.dart';

abstract class MainPageListener {
  void onBtnMenuPressed();
  void onBtnCreateRoomPressed();
  void onBtnJoinRoomPressed();
  void onRoomItemClicked(RoomPresentableModel selectedRoom);
}
