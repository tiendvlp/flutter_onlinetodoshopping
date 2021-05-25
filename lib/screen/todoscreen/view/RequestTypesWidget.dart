import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onlinetodoshipping/screen/common/RequestProvider.dart';

class RequestTypesWidget extends StatelessWidget {
  RequestProvider _requestProvider = RequestProvider();

  final double width;
  final double height;

  final Function(RequestItem selectedRequest) onRequestSelected;

  RequestTypesWidget(
      {@required this.width,
      @required this.height,
      @required this.onRequestSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: this.height,
        child: ListView(scrollDirection: Axis.horizontal, children: [
          Container(
            width: 15,
          ),
          ..._requestProvider.requests
              .map((e) => CupertinoButton(
                    onPressed: () {
                      onRequestSelected(e);
                    },
                    padding: EdgeInsets.zero,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      height: 40,
                      width: (this.width - 60.0) / 3,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Text(
                        e.toString(),
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[600]),
                      ),
                    ),
                  ))
              .toList(),
          Container(
            width: 60,
          ),
        ]));
  }
}
