import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_permanentka/value_objects/checkbox_value_object.dart';
import 'package:e_permanentka/value_objects/ePermanentka_value_object.dart';

class CheckBoxRepository {
  final _firestore = FirebaseFirestore.instance;

  Future<List<CheckboxValueObject>> getAllForEPermanentka(
      EPermanentkaValueObject ePermanentkaValueObject) async {
    QuerySnapshot querySnapshot = await _firestore
        .collection('users')
        .doc(ePermanentkaValueObject.userId)
        .collection('ePermanentka')
        .doc(ePermanentkaValueObject.id)
        .collection('checkBox')
        .get();

    List<CheckboxValueObject> listOfCheckboxes = [];

    querySnapshot.docs.forEach((QueryDocumentSnapshot doc) {
      listOfCheckboxes.add(CheckboxValueObject(
          ePermanentkaValueObject, doc.data()!,
          id: doc.id));
    });

    return listOfCheckboxes;
  }

  Future<CheckboxValueObject> save(
      CheckboxValueObject checkBoxValueObject) async {
    if (checkBoxValueObject.id.isEmpty) {
      await this.create(checkBoxValueObject);
    } else {
      await this.update(checkBoxValueObject);
    }

    return checkBoxValueObject;
  }

  Future<CheckboxValueObject> create(
      CheckboxValueObject checkBoxValueObject) async {
    DocumentReference doc = await _firestore
        .collection('users')
        .doc(checkBoxValueObject.userId)
        .collection('ePermanentka')
        .doc(checkBoxValueObject.ePermanentkaValueObject.id)
        .collection('checkBox')
        .add(checkBoxValueObject.toMap());

    checkBoxValueObject.id = doc.id;

    return checkBoxValueObject;
  }

  Future<CheckboxValueObject> update(
      CheckboxValueObject checkBoxValueObject) async {
    await _firestore
        .collection('users')
        .doc(checkBoxValueObject.userId)
        .collection('ePermanentka')
        .doc(checkBoxValueObject.ePermanentkaValueObject.id)
        .collection('checkBox')
        .doc(checkBoxValueObject.id)
        .update(checkBoxValueObject.toMap());

    return checkBoxValueObject;
  }

  List<CheckboxValueObject> getAllForUser(String userId) {
    List<CheckboxValueObject> checkboxValueObjects = [];

    return checkboxValueObjects;
  }
}
