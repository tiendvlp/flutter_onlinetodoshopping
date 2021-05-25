import 'package:flutter/material.dart';
import 'package:onlinetodoshipping/screen/common/BaseWidget.dart';
import 'package:onlinetodoshipping/screen/common/ColorSrc.dart';
import 'package:onlinetodoshipping/screen/roomscreen/listeners/RoomPageListener.dart';
import 'package:onlinetodoshipping/screen/roomscreen/model/RoomPresentableModel.dart';
import 'package:onlinetodoshipping/screen/roomscreen/views/RoomInfoWidget.dart';
import 'package:onlinetodoshipping/screen/roomscreen/views/TodoListWidget.dart';
import 'package:onlinetodoshipping/screen/todoscreen/controller/TodoScreen.dart';
import 'package:provider/provider.dart';

class RoomPage extends StatefulWidget {
  static void start(BuildContext context, RoomPresentableModel room) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return RoomPage(room);
    }));
  }

  final RoomPresentableModel room;

  RoomPage(this.room) {}

  @override
  State<StatefulWidget> createState() {
    return _RoomPageState();
  }
}

class _RoomPageState extends State<RoomPage> implements RoomPageListener {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [Provider(create: (_) => this as RoomPageListener)],
      child: BaseWidget(
        builder: (_, size, platform) {
          return Scaffold(
              backgroundColor: ColorSrc.pink3,
              body: Container(
                height: size.screenSize.height,
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    RoomInfoWidget(size.localWidgetSize.height * 0.45,
                        double.infinity, widget.room),
                    TodoListWidget(size.localWidgetSize.height * 0.55)
                  ],
                ),
              ));
        },
      ),
    );
  }

  @override
  void onBtnCreateTodoListClicked() {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return TodoScreen(widget.room.title, widget.room.id);
    }));
  }
}
