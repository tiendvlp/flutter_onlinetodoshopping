import 'package:flutter/material.dart';

import 'DeviceScreenType.dart';

enum AspectRatioType { LONG, SHORT }

class SizingInformation {
  final Orientation orientation;
  final DeviceScreenType deviceScreenType;
  final Size screenSize;
  final Size localWidgetSize;
  AspectRatioType aspectRatioType;

  SizingInformation(this.orientation, this.deviceScreenType, this.screenSize,
      this.localWidgetSize) {
    if ((screenSize.height / screenSize.width) > 1.8) {
      aspectRatioType = AspectRatioType.LONG;
    } else {
      aspectRatioType = AspectRatioType.SHORT;
    }
  }

  @override
  String toString() {
    return 'Orientation:$orientation DeviceType:$deviceScreenType ScreenSize:$screenSize LocalWidgetSize:$localWidgetSize';
  }
}
