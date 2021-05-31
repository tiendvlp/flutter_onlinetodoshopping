import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onlinetodoshipping/screen/common/ColorSrc.dart';
import 'package:onlinetodoshipping/screen/common/RequestProvider.dart';
import 'package:onlinetodoshipping/screen/common/helper/Helper.dart';
import 'package:onlinetodoshipping/screen/todoscreen/model/TodoScreenState.dart';
import 'package:onlinetodoshipping/screen/widget/ClearableTextField.dart';
import 'package:provider/provider.dart';

class SelectedRequestWidget extends StatelessWidget {
  final double width;
  final RequestItem request;
  final Function(String text) onTextChanged;
  final FocusNode focusNode;

  SelectedRequestWidget(
      {@required this.width, this.request, this.onTextChanged, this.focusNode});

  @override
  Widget build(BuildContext context) {
    final state = context.read<TodoScreenState>();
    String defaultText = state.inputForm[getEnumValue(request.type)];
    return Container(
      child: Column(
        children: [
          ...request != null
              ? [
                  Container(
                    height: 20,
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
                child: ClearableTextFeild(
                  focusNode: focusNode,
                  defaultText: defaultText,
                  onChanged: this.onTextChanged,
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  hint: "Aa",
                ),
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
