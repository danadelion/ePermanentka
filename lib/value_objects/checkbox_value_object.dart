import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class CheckBoxValueObject {
  late String id;
  late String userId;
  //late String ePermanentkaId;
  late DateTime? broadcasted;
  late bool checkbox;
  late DateTime? practiced;
  late int index;

  CheckBoxValueObject(Map data, {id = ''}) {
    this.id = id;
    this.userId = data['user'];
    // this.ePermanentkaId = data['ePermanentka'];
    this.index = data['index'];
    this.broadcasted = data.containsKey('broadcasted')
        ? DateTime.parse(data['broadcasted'])
        : null;
    this.checkbox = data.containsKey('checkbox') ? data['checkbox'] : false;
    this.practiced = data.containsKey('practiced')
        ? DateTime.parse(data['practiced'])
        : null;
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'index': index,
      'user': userId,
      // 'ePermanentka': ePermanentkaId,
      'checkbox': checkbox,
    };

    if (practiced != null) {
      map['practiced'] = practiced!.toString();
    }

    if (broadcasted != null) {
      map['broadcasted'] = broadcasted!.toString();
    }

    return map;
  }
}
