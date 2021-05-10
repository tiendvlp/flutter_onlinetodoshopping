import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:onlinetodoshipping/screen/common/BaseWidget.dart';
import 'package:onlinetodoshipping/screen/common/ColorSrc.dart';
import 'package:onlinetodoshipping/screen/loginscreen/view/LoginInteractContent.dart';

class LoginPageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DatabaseReference db = FirebaseDatabase(
            databaseURL:
                "https://shoppingtodolistonline-default-rtdb.asia-southeast1.firebasedatabase.app")
        .reference();
    return Scaffold(body: BaseWidget(
      builder: (context, sizingInformation, platformInfo) {
        return Container(
          width: double.infinity,
          decoration: BoxDecoration(color: ColorSrc.yellow1),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Positioned(
                bottom: 350,
                child: SizedBox(
                    width: 300,
                    child: Image.asset("assets/image/image_launch.png")),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  height: 400,
                  width: sizingInformation.screenSize.width * 2,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(
                              sizingInformation.screenSize.width),
                          topRight: Radius.circular(
                              sizingInformation.screenSize.width))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Never Forget",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 35,
                            fontFamily: "OpenSans"),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "When go ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 35,
                                fontFamily: "OpenSans"),
                          ),
                          Text(
                            "shopping",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 35,
                                color: Colors.red[400],
                                fontFamily: "OpenSans"),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      LoginMainContent()
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    ));
  }
}
