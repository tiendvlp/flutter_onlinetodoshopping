import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onlinetodoshipping/screen/common/BaseWidget.dart';

class FlatTextFieldWidget extends StatelessWidget {
  final Decoration decoration;
  final TextStyle textStyle;
  final String hint;
  final Function(String value) onChanged;
  final TextEditingController controller;
  final TextInputAction action;
  final Function(String) onSummitted;
  final bool enable;
  final FocusNode focusNode;

  FlatTextFieldWidget(
      {this.decoration,
      this.textStyle,
      this.hint,
      this.onChanged,
      this.controller,
      this.action,
      this.onSummitted,
      this.enable,
      this.focusNode});

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      builder: (context, sizingInformation, platformInfo) {
        return Container(
          decoration: decoration,
          child: Container(
            width: sizingInformation.localWidgetSize.width - 30,
            child: TextField(
              focusNode: focusNode,
              textInputAction: action,
              onSubmitted: onSummitted,
              onChanged: this.onChanged,
              enabled: this.enable,
              controller: controller,
              minLines: 1,
              maxLines: 2,
              maxLength: 80,
              decoration: InputDecoration(
                counterText: "",
                hintStyle: TextStyle(color: Colors.black),
                hintText: this.hint,
                contentPadding: EdgeInsets.only(left: 20, top: 15, bottom: 15),
                isDense: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
              ),
              style: textStyle,
            ),
          ),
        );
      },
    );
  }
}
