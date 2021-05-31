import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../DeviceScreenType.dart';

DeviceScreenType getDeviceType(MediaQueryData mediaQuery) {
  var orientation = mediaQuery.orientation;

  // Fixed Device width (changes with orientation)
  double deviceWidth = 0;

  if (orientation == Orientation.landscape) {
    deviceWidth = mediaQuery.size.height;
  } else {
    deviceWidth = mediaQuery.size.width;
  }

  if (deviceWidth > 950) {
    return DeviceScreenType.Desktop;
  }

  if (deviceWidth > 600) {
    return DeviceScreenType.Tablet;
  }

  return DeviceScreenType.Mobile;
}

bool isEnum(dynamic any) {
  final split = any.toString().split('.');
  return split.length > 1 && split[0] == any.runtimeType.toString();
}

void toast(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      backgroundColor: Colors.grey[300],
      textColor: Colors.white);
}

String getEnumValue(dynamic any) {
  if (!isEnum(any)) {
    throw Exception("Can not get the value of none enum type");
  }
  return any.toString().split('.')[1];
}
