import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onlinetodoshipping/screen/common/BaseWidget.dart';

class ClearableTextFeild extends StatelessWidget {
  final Decoration decoration;
  final TextStyle textStyle;
  final String hint;
  final fieldText = TextEditingController();
  final Function(String value) onChanged;
  final String defaultText;
  final FocusNode focusNode;

  ClearableTextFeild(
      {this.decoration,
      this.textStyle,
      this.hint,
      this.onChanged,
      this.defaultText,
      this.focusNode});

  @override
  Widget build(BuildContext context) {
    fieldText.text = defaultText;
    return BaseWidget(
      builder: (context, sizingInformation, platformInfo) {
        return Container(
          decoration: decoration,
          child: Row(
            children: [
              Container(
                width: sizingInformation.localWidgetSize.width - 30,
                child: TextField(
                  focusNode: focusNode,
                  onChanged: this.onChanged,
                  controller: fieldText,
                  minLines: 1,
                  maxLines: 2,
                  maxLength: 80,
                  decoration: InputDecoration(
                    counterText: "",
                    hintText: this.hint,
                    contentPadding:
                        EdgeInsets.only(left: 20, top: 15, bottom: 15),
                    isDense: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: textStyle,
                ),
              ),
              CupertinoButton(
                  padding: EdgeInsets.zero,
                  minSize: 25,
                  child: Icon(
                    Icons.clear,
                    color: Colors.grey,
                    size: 18,
                  ),
                  onPressed: () {
                    fieldText.clear();
                  })
            ],
          ),
        );
      },
    );
  }
}
