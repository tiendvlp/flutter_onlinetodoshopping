import 'package:flutter/material.dart';

import 'DeviceScreenType.dart';

class SizingInformation {
  final Orientation orientation;
  final DeviceScreenType deviceScreenType;
  final Size screenSize;
  final Size localWidgetSize;
  AspectRatio aspectRatio;

  SizingInformation(this.orientation, this.deviceScreenType, this.screenSize,
      this.localWidgetSize);

  @override
  String toString() {
    return 'Orientation:$orientation DeviceType:$deviceScreenType ScreenSize:$screenSize LocalWidgetSize:$localWidgetSize';
  }
}
