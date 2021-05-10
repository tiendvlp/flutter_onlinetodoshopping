import 'package:flutter/material.dart';
import 'package:onlinetodoshipping/screen/common/PlatformInfomation.dart';

import 'SizingInformation.dart';
import 'helper/Helper.dart';

class BaseWidget extends StatelessWidget {
  final Widget Function(
      BuildContext context,
      SizingInformation sizingInformation,
      PlatformInfomation platformInfo) builder;

  const BaseWidget({Key key, this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return LayoutBuilder(builder: (ctx, constrants) {
      final SizingInformation sizingInformation = SizingInformation(
          mediaQuery.orientation,
          getDeviceType(mediaQuery),
          mediaQuery.size,
          Size(constrants.maxWidth, constrants.maxHeight));
      return builder(
          context, sizingInformation, PlatformInfomation(context: context));
    });
  }
}
