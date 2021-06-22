import 'package:e_permanentka/value_objects/ePermanentka_value_object.dart';
import 'package:e_permanentka/enum/training_type_enum.dart';

class CheckBoxValueObject {
  late String id;
  late String userId;
  late DateTime? broadcasted;
  late bool checkbox;
  late DateTime? practiced;
  late int index;
  late EPermanentkaValueObject ePermanentkaValueObject;
  late TrainingType? trainingType;

  CheckBoxValueObject(EPermanentkaValueObject ePermanentkaValueObject, Map data,
      {id = ''}) {
    this.id = id;
    this.userId = data['user'];
    this.index = data['index'];
    this.broadcasted = data.containsKey('broadcasted')
        ? DateTime.parse(data['broadcasted'])
        : DateTime.now();
    this.checkbox = data.containsKey('checkbox') ? data['checkbox'] : false;
    this.practiced = data.containsKey('practiced')
        ? DateTime.parse(data['practiced'])
        : DateTime.now();
    this.ePermanentkaValueObject = ePermanentkaValueObject;
    this.trainingType = (data.containsKey('trainingType')
        ? TrainingType.values
            .firstWhere((element) => element.toString() == data['trainingType'])
        : null);
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'index': index,
      'user': userId,
      'checkbox': checkbox,
      'practiced': practiced,
      'broadcasted': broadcasted,
      'trainingType': trainingType.toString(),
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
