import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onlinetodoshipping/screen/common/ColorSrc.dart';
import 'package:onlinetodoshipping/screen/common/RequestProvider.dart';

class SelectedRequestWidget extends StatelessWidget {
  final double width;
  final RequestItem request;

  SelectedRequestWidget({@required this.width, this.request});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ...request != null
              ? [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(left: 25),
                    child: Text(
                      request.toString(),
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                ]
              : [],
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: this.width - 50,
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: TextField(
                        minLines: 1,
                        maxLines: 2,
                        maxLength: 80,
                        decoration: InputDecoration(
                          counterText: "",
                          hintText: "Aa",
                          contentPadding: EdgeInsets.only(
                              left: 20, top: 15, right: 20, bottom: 15),
                          isDense: true,
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                        ))),
              ),
              Center(
                child: CupertinoButton(
                  padding: const EdgeInsets.only(right: 20),
                  minSize: 30,
                  onPressed: () {
                    FocusScopeNode currentFocus = FocusScope.of(context);
                    currentFocus.unfocus();
                  },
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: ColorSrc.red2,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.add,
                        color: Colors.grey[100],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
