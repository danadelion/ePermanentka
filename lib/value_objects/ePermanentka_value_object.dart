import 'package:firebase_auth/firebase_auth.dart';

final _auth = FirebaseAuth.instance;
User? loggedInUser = _auth.currentUser;

class EPermanentkaValueObject {
  late String id;
  late String userId;
  late String email;
  late DateTime created;

  EPermanentkaValueObject(Map data, {id = ''}) {
    this.id = id;
    this.userId = data['user'];
    this.email = loggedInUser!.email.toString();
    this.created = data.containsKey('created')
        ? DateTime.parse(data['created'])
        : DateTime.now();
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'permanentkaId': id,
      'user': userId,
      'created': created.toString(),
      'email': email,
    };
    return map;
  }
}
