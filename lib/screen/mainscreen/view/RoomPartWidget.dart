import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onlinetodoshipping/screen/common/BaseWidget.dart';
import 'package:onlinetodoshipping/screen/common/ColorSrc.dart';
import 'package:onlinetodoshipping/screen/mainscreen/listener/MainPageListener.dart';
import 'package:onlinetodoshipping/screen/mainscreen/model/MainPageState.dart';
import 'package:onlinetodoshipping/screen/mainscreen/view/ItemRoomWidget.dart';
import 'package:provider/provider.dart';

class RoomPartWidget extends StatelessWidget {
  final double width;
  final double height;

  RoomPartWidget(this.height, this.width);

  @override
  Widget build(BuildContext context) {
    final listener = context.read<MainPageListener>();
    final provider = Provider.of<MainPageState>(context, listen: true);
    return Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        width: this.width,
        height: this.height,
        child: BaseWidget(builder: (_, size, platform) {
          return Container(
            child: Column(
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Rooms',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 35)),
                      Container(
                        child: Row(
                          children: [
                            CupertinoButton(
                                padding: EdgeInsets.only(top: 5, bottom: 5),
                                color: Colors.yellow,
                                child: Container(
                                  width: 70,
                                  child: Center(
                                    child: Text(
                                      'Create',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  listener.onBtnCreateRoomPressed();
                                }),
                            SizedBox(
                              width: 15,
                            ),
                            CupertinoButton(
                                padding: EdgeInsets.only(top: 5, bottom: 5),
                                color: ColorSrc.red1,
                                child: Container(
                                  width: 70,
                                  child: Center(
                                    child: Text(
                                      'Join',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  listener.onBtnJoinRoomPressed();
                                })
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: height - 70,
                  child: ListView.builder(
                    itemCount: provider.rooms.length,
                    itemBuilder: (context, index) {
                      return ItemRoomWidget(provider.rooms.elementAt(index));
                    },
                  ),
                )
              ], //
            ),
          );
        }));
  }
}
//
