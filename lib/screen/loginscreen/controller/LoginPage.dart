import 'package:flutter/material.dart';
import 'package:onlinetodoshipping/screen/applicationstate/ApplicationState.dart';
import 'package:onlinetodoshipping/screen/applicationstate/User.dart';
import 'package:onlinetodoshipping/screen/common/helper/Helper.dart';
import 'package:onlinetodoshipping/screen/loginscreen/controller/LoginController.dart';
import 'package:onlinetodoshipping/screen/loginscreen/listener/LoginPageListener.dart';
import 'package:onlinetodoshipping/screen/loginscreen/model/LoginPageState.dart';
import 'package:provider/provider.dart';

import '../view/LoginPageWidget.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State {
  LoginPageListener _listener;
  LoginController _loginController;

  _LoginPageState() {
    _loginController = LoginController();
    _listener = LoginPageListener(
        onBtnLoginWithApplePressed: this._onBtnLoginWithApplePressed,
        onBtnLoginWithGooglePressed: this._onBtnLoginWithGooglePressed);
  }

  void _onBtnLoginWithGooglePressed() {
    print("LoginWithGoogle clicked");
    _loginController.signInWithGoogle().then((value) {
      if (value != null) {
        context.read<ApplicationState>().user =
            User(email: value.email, name: value.displayName);
        // navigate to mainsreen
        toast("Welcome");
      } else {
        toast("Login Failed");
      }
    });
  }

  void _onBtnLoginWithApplePressed() {
    print("LoginWithApple clicked");
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (ctx) {
        return LoginPageState();
      }),
      Provider(create: (ctx) {
        return _listener;
      })
    ], child: LoginPageWidget());
  }
}
