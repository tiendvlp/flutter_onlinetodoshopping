import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onlinetodoshipping/screen/applicationstate/ApplicationState.dart';
import 'package:onlinetodoshipping/screen/common/BaseWidget.dart';
import 'package:onlinetodoshipping/screen/common/ColorSrc.dart';
import 'package:onlinetodoshipping/screen/common/helper/Helper.dart';
import 'package:onlinetodoshipping/screen/createroomscreen/controller/CreateRoomController.dart';
import 'package:provider/provider.dart';

class _CreateRoomFormInput {
  String roomName;
  String nickName;
}

class CreateRoomPage extends StatelessWidget {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  _CreateRoomFormInput _formData = _CreateRoomFormInput();

  //controller
  CreateRoomController _createRoomController;

  static void start(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (_) {
        return CreateRoomPage();
      },
    ));
  }

  void _navigateBack(BuildContext context) {
    Navigator.of(context).pop();
  }

  void onBtnCreatePressed() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      _createRoomController
          .createRoom(_formData.nickName, _formData.roomName)
          .then((result) {
        switch (result) {
          case CreateRoomResult.Success:
            toast("Create room Success");
            break;
          case CreateRoomResult.Failed:
            toast("Create room Failed");
            break;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore.instance
        .collection("Room")
        .where("MemberEmails", arrayContains: "tiendmse150195@fpt.edu.vn")
        .snapshots()
        .listen((event) {
      print("New roomadded");
    });
    FirebaseFirestore.instance
        .collection("Room")
        .where("members", arrayContains: {
          "Email": "tiendvlp@gmail.com",
        })
        .snapshots()
        .listen((event) {
          print("Nice result: ${event.docs.length}");
        });

    _createRoomController =
        CreateRoomController(context.read<ApplicationState>());
    return Scaffold(
        backgroundColor: ColorSrc.pink3,
        appBar: AppBar(
            toolbarHeight: 100,
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            leading: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: CupertinoButton(
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 30,
                  color: Colors.grey,
                ),
                onPressed: () => _navigateBack(context),
              ),
            )),
        body: BaseWidget(
          builder: (_, size, platform) {
            return Container(
              margin: EdgeInsets.only(top: size.localWidgetSize.height * 0.2),
              width: double.infinity,
              child: Container(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Your nickname",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w900,
                                fontSize: 16,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 4),
                              width: 240,
                              child: TextFormField(
                                style: TextStyle(height: 1.0),
                                decoration: InputDecoration(
                                    isDense: true,
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(7)))),
                                textInputAction: TextInputAction.next,
                                validator: (content) {
                                  if (content.isEmpty) {
                                    return "Please fill you nickname";
                                  }
                                  // return the error; null means correct
                                  return null;
                                },
                                onSaved: (content) {
                                  _formData.nickName = content;
                                },
                              ),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Text(
                              "Room name",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w900,
                                fontSize: 16,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 4),
                              width: 240,
                              child: TextFormField(
                                style: TextStyle(height: 1.0),
                                decoration: InputDecoration(
                                    isDense: true,
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(7)))),
                                textInputAction: TextInputAction.next,
                                validator: (content) {
                                  if (content.isEmpty) {
                                    return "Room name could not be empty";
                                  }
                                  // return the error; null means correct
                                  return null;
                                },
                                onSaved: (content) {
                                  _formData.roomName = content;
                                },
                              ),
                            ),
                          ],
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    CupertinoButton(
                        padding: EdgeInsets.zero,
                        color: ColorSrc.red1,
                        child: Container(
                          width: 240,
                          child: Center(
                            child: Text(
                              "Create",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        onPressed: onBtnCreatePressed)
                  ],
                ),
              ),
            );
          },
        ));
  }
}
