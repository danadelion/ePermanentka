import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EmailSignInProvider extends ChangeNotifier {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  late UserCredential? user;

  bool showSpinner = false;
  bool _isSigningInWithEmail = false;
  bool _isRegisteringWithEmail = false;
  bool get isSigningInWithEmail => _isSigningInWithEmail;
  bool get isRegisteringWithEmail => _isRegisteringWithEmail;

  set isSigningInWithEmail(bool isSigningInWithEmail) {
    _isSigningInWithEmail = isSigningInWithEmail;
    notifyListeners();
  }

  set isRegisteringWithEmail(bool isRegisteringWithEmail) {
    _isRegisteringWithEmail = isRegisteringWithEmail;
    notifyListeners();
  }

  Future loginWithEmail(String email, String password) async {
    isSigningInWithEmail = true;

    user = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    isSigningInWithEmail = false;
    notifyListeners();
  }

  void register(String email, String password) async {
    isRegisteringWithEmail = true;
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      print(e);
    }
    isRegisteringWithEmail = false;
  }

  void logoutWithEmail() async {
    FirebaseAuth.instance.signOut();
  }

  bool isLoggedIn() {
    return _auth.currentUser != null;
  }
}
