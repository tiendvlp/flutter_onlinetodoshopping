import 'package:flutter/material.dart';
import 'package:onlinetodoshipping/screen/mainscreen/listener/MainPageListener.dart';
import 'package:onlinetodoshipping/screen/mainscreen/view/MainPageView.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  static void start(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return MainPage();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiProvider(
        providers: [Provider(create: (_) => MainPageListener())],
        child: SafeArea(child: MainPageView()),
      ),
    );
  }
}
