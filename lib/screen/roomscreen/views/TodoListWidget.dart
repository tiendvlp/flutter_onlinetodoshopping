import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onlinetodoshipping/screen/common/BaseWidget.dart';
import 'package:onlinetodoshipping/screen/common/ColorSrc.dart';
import 'package:onlinetodoshipping/screen/roomscreen/listeners/RoomPageListener.dart';
import 'package:provider/provider.dart';

class TodoListWidget extends StatelessWidget {
  final double height;

  TodoListWidget(this.height);

  @override
  Widget build(BuildContext context) {
    final listener = context.read<RoomPageListener>();
    return BaseWidget(
      builder: (_, size, platform) {
        return Container(
            padding: EdgeInsets.only(top: 20, left: 35, right: 35),
            height: this.height,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Lists",
                      style: TextStyle(
                          color: ColorSrc.darkBlue,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    CupertinoButton(
                        color: ColorSrc.red1,
                        minSize: 35,
                        padding: EdgeInsets.only(left: 15, right: 15),
                        child: Text("Create",
                            style: TextStyle(color: Colors.white)),
                        onPressed: () {
                          listener.onBtnCreateTodoListClicked();
                        })
                  ],
                )
              ],
            ));
      },
    );
  }
}
