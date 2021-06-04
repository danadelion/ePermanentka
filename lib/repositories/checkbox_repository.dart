import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_permanentka/value_objects/checkbox_value_object.dart';
import 'package:e_permanentka/value_objects/ePermanentka_value_object.dart';

class CheckBoxRepository {
  final _firestore = FirebaseFirestore.instance;

  Future<CheckBoxValueObject> save(
      CheckBoxValueObject checkBoxValueObject) async {
    if (checkBoxValueObject.id.isEmpty) {
      await this.create(checkBoxValueObject);
    } else {
      await this.update(checkBoxValueObject);
    }

    return checkBoxValueObject;
  }

  Future<CheckBoxValueObject> create(
      CheckBoxValueObject checkBoxValueObject) async {
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

  Future<CheckBoxValueObject> update(
      CheckBoxValueObject checkBoxValueObject) async {
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

  List<CheckBoxValueObject> getAllForUser(String userId) {
    List<CheckBoxValueObject> checkboxValueObjects = [];

    return checkboxValueObjects;
  }
}
