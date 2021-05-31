import 'package:flutter/material.dart';
import 'package:onlinetodoshipping/screen/common/ColorSrc.dart';
import 'package:onlinetodoshipping/screen/roomscreen/model/TodoListPresentableModel.dart';

class ItemTodoListWidget extends StatelessWidget {
  final TodoListPresentableModel _todoList;

  const ItemTodoListWidget(Key key, this._todoList) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 18),
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Color(0xffE6E6E6),
                spreadRadius: -16,
                offset: Offset(0, 15),
                blurRadius: 23),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _todoList.title,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: ColorSrc.darkBlue),
          ),
          SizedBox(
            height: 6,
          ),
          Text(_todoList.latestUpdate,
              style: TextStyle(
                  fontWeight: FontWeight.normal, color: Colors.grey[400])),
        ],
      ),
    );
  }
}
