import 'package:flutter/material.dart';

class PlatformInfomation {
  final BuildContext context;
  bool isIOS;
  bool isAndroid;

  PlatformInfomation({this.context}) {
    final platform = Theme.of(context).platform;
    isIOS = platform == TargetPlatform.iOS;
    isAndroid = platform == TargetPlatform.android;
  }
}
