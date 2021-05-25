import 'package:flutter/cupertino.dart';
import 'package:onlinetodoshipping/screen/common/ColorSrc.dart';

class MainTopBackgroundWidget extends StatelessWidget {
  final double height;
  final double width;

  MainTopBackgroundWidget(
      {@required this.height, this.width = double.infinity});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: this.width,
          height: this.height,
          decoration: BoxDecoration(color: ColorSrc.pink1),
        ),
        Positioned(
            right: 30,
            left: 30,
            child: SafeArea(
              child: ClipRRect(
                child: Image.asset(
                  "assets/image/backgroundimg.png",
                  fit: BoxFit.cover,
                ),
              ),
            )),
      ],
    );
  }
}
