import 'package:flutter/material.dart';
import 'package:onlinetodoshipping/screen/applicationstate/ApplicationState.dart';
import 'package:onlinetodoshipping/screen/createroomscreen/controller/CreateRoomPage.dart';
import 'package:onlinetodoshipping/screen/mainscreen/controller/RoomController.dart';
import 'package:onlinetodoshipping/screen/mainscreen/listener/MainPageListener.dart';
import 'package:onlinetodoshipping/screen/mainscreen/model/MainPageState.dart';
import "package:onlinetodoshipping/screen/mainscreen/model/RoomPresentableModel.dart"
    as mainpage;
import 'package:onlinetodoshipping/screen/roomscreen/model/RoomPresentableModel.dart';
import 'package:onlinetodoshipping/screen/mainscreen/view/MainPageWidget.dart';
import 'package:onlinetodoshipping/screen/roomscreen/constrollers/RoomPage.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  static void start(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
      builder: (_) {
        return MainPage();
      },
    ), (r) => false);
  }

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> implements MainPageListener {
  //Controllers
  RoomController _roomController;
  MainPageState _state;
  _MainPageState() {}

  @override
  void initState() {
    _state = MainPageState();
    _roomController = RoomController(_state);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _roomController.getRooms(context.read<ApplicationState>().user.email);
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => _state),
      Provider(create: (ctx) => this as MainPageListener),
    ], child: MainPageWidget());
  }

  @override
  void onBtnCreateRoomPressed() {
    CreateRoomPage.start(context);
  }

  @override
  void onBtnJoinRoomPressed() {}

  @override
  void onBtnMenuPressed() {}

  @override
  void onRoomItemClicked(mainpage.RoomPresentableModel selectedRoom) {
    RoomPage.start(
        context,
        RoomPresentableModel(
            selectedRoom.title, selectedRoom.id, selectedRoom.latestUpdate));
  }
}
