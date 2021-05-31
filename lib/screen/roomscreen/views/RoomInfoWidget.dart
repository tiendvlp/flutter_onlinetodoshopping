import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onlinetodoshipping/screen/common/BaseWidget.dart';
import 'package:onlinetodoshipping/screen/common/ColorSrc.dart';
import 'package:onlinetodoshipping/screen/roomscreen/model/RoomPresentableModel.dart';
import 'package:onlinetodoshipping/screen/widget/MainTopBackGroundWidget.dart';

class RoomInfoWidget extends StatelessWidget {
  final double height;
  final double width;
  final RoomPresentableModel room;
  RoomInfoWidget(this.height, this.width, this.room);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: this.height,
        width: this.width,
        child: BaseWidget(builder: (_, size, platform) {
          return Stack(
            children: [
              MainTopBackgroundWidget(
                  height: size.localWidgetSize.height * 0.8),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CupertinoButton(
                          padding: EdgeInsets.zero,
                          child: Icon(
                            Icons.arrow_back_ios,
                            size: 25,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          }),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            room.title,
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: ColorSrc.darkBlue),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          CupertinoButton(
                              color: ColorSrc.red1,
                              minSize: 32,
                              padding: EdgeInsets.only(left: 22, right: 22),
                              child: Container(
                                height: 15,
                                child: Text(
                                  "Share",
                                  softWrap: false,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              onPressed: () {}),
                        ],
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          Text(
                            "Id: ${room.id}",
                            style: TextStyle(
                                fontSize: 18, color: Colors.grey[600]),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          CupertinoButton(
                              color: Colors.white,
                              minSize: 28,
                              padding: EdgeInsets.only(left: 15, right: 15),
                              child: Text(
                                "copy",
                                softWrap: false,
                                style: TextStyle(color: Colors.grey[800]),
                              ),
                              onPressed: () {})
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Text("Notification",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: ColorSrc.darkBlue))
                    ],
                  ),
                ),
              )
            ],
          );
        }));
  }
}
