import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_permanentka/repositories/checkbox_repository.dart';
import 'package:e_permanentka/repositories/user_repository.dart';
import 'package:e_permanentka/value_objects/checkbox_value_object.dart';
import 'package:e_permanentka/value_objects/ePermanentka_value_object.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EPermanentkaRepository {
  final _firestore = FirebaseFirestore.instance;
  final CheckBoxRepository checkBoxRepository = CheckBoxRepository();
  final UserRepository userRepository = UserRepository();
  var receivedEPermanentka = [];
  User? loggedInUser;

  Future<List<EPermanentkaValueObject>> getAllForCurrentUser() async {
    QuerySnapshot querySnapshot = await _firestore
        .collection('users')
        .doc(userRepository.getFirebaseUser()!.uid)
        .collection('ePermanentka')
        .get();

    List<EPermanentkaValueObject> listOfEPermanentka = [];

    for (var doc in querySnapshot.docs) {
      EPermanentkaValueObject ePermanentkaValueObject =
          EPermanentkaValueObject(doc.data()!, id: doc.id);
          
      List<CheckboxValueObject> listOfCheckboxes = await checkBoxRepository
          .getAllForEPermanentka(ePermanentkaValueObject);

      ePermanentkaValueObject.listOfCheckboxes = listOfCheckboxes;

      listOfEPermanentka.add(ePermanentkaValueObject);
    }

    return listOfEPermanentka;
  }

  EPermanentkaValueObject getEPermanentkaData(
      int index, List receivedPermanentka) {
    EPermanentkaValueObject emptyObject = EPermanentkaValueObject({
      'index': index,
      'user': loggedInUser!.uid,
      'email': loggedInUser!.email,
    });

    if (receivedEPermanentka.isEmpty) {
      return emptyObject;
    }
    try {
      QueryDocumentSnapshot? doc = receivedEPermanentka.firstWhere(
        (var element) {
          return element.exists && element['index'] == index;
        },
      );
      return EPermanentkaValueObject(doc!.data()!, id: doc.id);
    } catch (e) {
      return emptyObject;
    }
  }

  Future<EPermanentkaValueObject> save(
      EPermanentkaValueObject ePermanentkaValueObject) async {
    if (ePermanentkaValueObject.id.isEmpty) {
      await this.create(ePermanentkaValueObject);
    } else {
      await this.update(ePermanentkaValueObject);
    }

    return ePermanentkaValueObject;
  }

  Future<EPermanentkaValueObject> create(
      EPermanentkaValueObject ePermanentkaValueObject) async {
    DocumentReference doc = await _firestore
        .collection('users')
        .doc(ePermanentkaValueObject.userId)
        .collection('ePermanentka')
        // .doc(ePermanentkaValueObject.id)
        // .collection('checkBox')
        .add(ePermanentkaValueObject.toMap());

    ePermanentkaValueObject.id = doc.id;

    return ePermanentkaValueObject;
  }

  Future<EPermanentkaValueObject> update(
      EPermanentkaValueObject ePermanentkaValueObject) async {
    await _firestore
        .collection('users')
        .doc(ePermanentkaValueObject.userId)
        .collection('ePermanentka')
        .doc(ePermanentkaValueObject.id)
        .update(ePermanentkaValueObject.toMap());

    return ePermanentkaValueObject;
  }

  List<EPermanentkaValueObject> getAllForUser(String userId) {
    List<EPermanentkaValueObject> ePermanentkaValueObject = [];

    return ePermanentkaValueObject;
  }
}
