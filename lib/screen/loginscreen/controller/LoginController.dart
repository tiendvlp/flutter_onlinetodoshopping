import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

enum SignInWithGoogleResult { Success, Failed }

class LoginController {
  Future<User> signInWithGoogle() async {
    final GoogleSignIn ggSignIn = GoogleSignIn();
    final FirebaseAuth _auth = FirebaseAuth.instance;

    GoogleSignInAccount ggSignInAccount = await ggSignIn.signInSilently();

    if (ggSignInAccount == null) {
      ggSignInAccount = await ggSignIn.signIn();
    }

    final GoogleSignInAuthentication ggAuth =
        await ggSignInAccount.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: ggAuth.accessToken, idToken: ggAuth.idToken);
    final UserCredential result = await _auth.signInWithCredential(credential);

    final _user = result.user;

    if (_user.isAnonymous || await _user.getIdToken() == null) {
      return null;
    }

    final User currentUser = await _auth.currentUser;
    if (_user.uid != currentUser.uid) {
      return null;
    }

    return currentUser;
  }
}
