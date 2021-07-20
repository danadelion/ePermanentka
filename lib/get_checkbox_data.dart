import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_permanentka/value_objects/checkbox_value_object.dart';
import 'package:e_permanentka/value_objects/ePermanentka_value_object.dart';

CheckboxValueObject getCheckBoxData(
    EPermanentkaValueObject ePermanentkaValueObject,
    int index,
    List receivedCheckboxes) {
  CheckboxValueObject emptyObject =
      CheckboxValueObject(ePermanentkaValueObject, {
    'index': index,
    'user': loggedInUser!.uid,
  });

  if (receivedCheckboxes.isEmpty) {
    return emptyObject;
  }
  try {
    QueryDocumentSnapshot? doc = receivedCheckboxes.firstWhere(
      (var element) {
        return element.exists && element['index'] == index;
      },
    );
    return CheckboxValueObject(ePermanentkaValueObject, doc!.data()!,
        id: doc.id);
  } catch (e) {
    return emptyObject;
  }
}
