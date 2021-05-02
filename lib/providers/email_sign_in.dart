import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EmailSignInProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  late UserCredential? user;
  late String _errorMessage = '';

  void inputData() {
    final User user = _auth.currentUser!;
    final uid = user.uid;
    print(uid);
  }

  bool showSpinner = false;
  bool _isSigningInWithEmail = false;
  bool _isRegisteringWithEmail = false;
  bool get isSigningInWithEmail => _isSigningInWithEmail;
  bool get isRegisteringWithEmail => _isRegisteringWithEmail;
  String get errorMessage => _errorMessage;

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

    try {
      user = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "ERROR_WRONG_PASSWORD":
        case "wrong-password":
          _errorMessage = 'Nesprávný email nebo heslo.';
          break;
        case "ERROR_USER_NOT_FOUND":
        case "user-not-found":
          _errorMessage = "Uživatel nebyl nalezen.";
          break;
        case "ERROR_INVALID_EMAIL":
        case "invalid-email":
          _errorMessage = "Neplatný email.";
          break;
        default:
          _errorMessage = "Přihlášení selhalo. Zkus to znovu.";
          break;
      }
    }
    isSigningInWithEmail = false;
    notifyListeners();
  }

  void register(String name, String email, String password) async {
    isRegisteringWithEmail = true;

    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then(
            (currentUser) => FirebaseFirestore.instance
                .collection('users')
                .doc(currentUser.user!.uid)
                .set(
              {
                'uid': currentUser.user!.uid,
                'name': name,
              },
            ),
          );
      // await _auth.createUserWithEmailAndPassword(
      //     email: email, password: password);
      User newUser = (await _auth.createUserWithEmailAndPassword(
          email: email, password: password)) as User;
      await newUser.sendEmailVerification();
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
