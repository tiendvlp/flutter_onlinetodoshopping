import 'package:flutter/material.dart';
import 'package:onlinetodoshipping/screen/common/BaseWidget.dart';
import 'package:onlinetodoshipping/screen/common/ColorSrc.dart';
import 'package:onlinetodoshipping/screen/mainscreen/listener/MainPageListener.dart';
import 'package:onlinetodoshipping/screen/mainscreen/model/RoomPresentableModel.dart';
import 'package:provider/provider.dart';

class ItemRoomWidget extends StatelessWidget {
  RoomPresentableModel model;

  ItemRoomWidget(this.model);
  @override
  Widget build(BuildContext context) {
    final listener = context.read<MainPageListener>();
    return BaseWidget(
      builder: (_, size, platform) {
        return GestureDetector(
          onTap: () {
            listener.onRoomItemClicked(model);
          },
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 13, horizontal: 20),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xffE6E6E6),
                        spreadRadius: -13,
                        offset: Offset(0, 17),
                        blurRadius: 23),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Last update: ${model.lastestUpdatePresentableString}",
                    textAlign: TextAlign.left,
                    style: TextStyle(color: ColorSrc.grey1),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    model.title,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    "Id: ${model.id}",
                    style: TextStyle(fontSize: 14),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
