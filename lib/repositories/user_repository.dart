import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_permanentka/value_objects/user_value_object.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserRepository {
  final _firestore = FirebaseFirestore.instance;
  var receivedUser;
  final _auth = FirebaseAuth.instance;

  Future<UserValueObject> getCurrentUser() async {
    User? loggedInUser = _auth.currentUser;

    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }

    await _firestore.collection('users').doc(loggedInUser!.uid).get().then(
      (var x) {
        receivedUser = x;
      },
    ).onError((error, stackTrace) {
      print(error.toString());
    });

    return UserValueObject('', '');
  }
}
