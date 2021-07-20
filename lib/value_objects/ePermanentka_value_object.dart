import 'package:e_permanentka/enum/training_type_enum.dart';
import 'package:e_permanentka/value_objects/checkbox_value_object.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _auth = FirebaseAuth.instance;
User? loggedInUser = _auth.currentUser;

class EPermanentkaValueObject {
  late String id;
  late String userId;
  late String email;
  late DateTime created;
  List<CheckboxValueObject> listOfCheckboxes = [];

  EPermanentkaValueObject(Map data,
      {id = '', List<CheckboxValueObject>? listOfCheckboxes}) {
    this.id = id;
    this.listOfCheckboxes = listOfCheckboxes ?? [];
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

  double countCheckboxes() {
    return this.listOfCheckboxes.fold(0,
        (count, CheckboxValueObject checkboxValueObject) {
      if (checkboxValueObject.trainingType == TrainingType.Outside) {
        return count + 1;
      }
      if (checkboxValueObject.trainingType == TrainingType.Online) {
        return count + 0.5;
      }

      return count;
    });
  }
}
