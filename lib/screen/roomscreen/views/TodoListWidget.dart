import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onlinetodoshipping/screen/common/BaseWidget.dart';
import 'package:onlinetodoshipping/screen/common/ColorSrc.dart';
import 'package:onlinetodoshipping/screen/roomscreen/listeners/RoomPageListener.dart';
import 'package:onlinetodoshipping/screen/roomscreen/model/RoomScreenState.dart';
import 'package:onlinetodoshipping/screen/roomscreen/views/ItemTodoListWidget.dart';
import 'package:onlinetodoshipping/screen/todoscreen/model/TodoScreenState.dart';
import 'package:provider/provider.dart';

class TodoListWidget extends StatelessWidget {
  final double height;

  TodoListWidget(this.height);

  @override
  Widget build(BuildContext context) {
    final listener = context.read<RoomPageListener>();
    final RoomScreenState screenState = context.watch();
    return Container(
        padding: EdgeInsets.only(top: 20, left: 25, right: 25),
        height: this.height,
        width: double.infinity,
        child: BaseWidget(
          builder: (_, size, platform) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 40,
                  child: Row(
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
                  ),
                ),
                Container(
                  height: size.localWidgetSize.height - 40,
                  child: ListView.builder(
                    itemCount: screenState.todoLists.length,
                    itemBuilder: (_, index) {
                      final todoList = screenState.todoLists.elementAt(index);
                      return ItemTodoListWidget(Key(todoList.id), todoList);
                    },
                  ),
                )
              ],
            );
          },
        ));
  }
}
