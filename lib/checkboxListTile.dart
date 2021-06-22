import 'package:e_permanentka/enum/training_type_enum.dart';
import 'package:e_permanentka/repositories/checkbox_repository.dart';
import 'package:e_permanentka/value_objects/ePermanentka_value_object.dart';
import 'package:e_permanentka/widgets/choice_of_training.dart';
import 'package:e_permanentka/widgets/online_training_widget.dart';
import 'package:e_permanentka/widgets/outside_training_widget.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'value_objects/checkbox_value_object.dart';

// final _firestore = FirebaseFirestore.instance;
final _checkboxRepository = CheckBoxRepository();
late final EPermanentkaValueObject ePermanentkaValueObject;

// ignore: must_be_immutable
class FlexibleCheckboxListTile extends StatefulWidget {
  CheckBoxValueObject checkboxValueObject;

  FlexibleCheckboxListTile(this.checkboxValueObject);

  @override
  _FlexibleCheckboxListTileState createState() =>
      _FlexibleCheckboxListTileState();
}

class _FlexibleCheckboxListTileState extends State<FlexibleCheckboxListTile> {
  DateTime selectedDate = DateTime.now();
  User? loggedInUser;

  @override
  Widget build(BuildContext context) {
    CheckBoxValueObject checkboxValueObject = widget.checkboxValueObject;
    selectedDate = (checkboxValueObject.broadcasted != null
        ? checkboxValueObject.broadcasted
        : DateTime.now())!;
    bool isChecked = checkboxValueObject.checkbox;

    return CheckboxListTile(
      activeColor: Color(0xFFF15124),
      dense: true,
      value: isChecked,
      selectedTileColor: Colors.white,
      checkColor: Color(0xFFF15124),
      onChanged: (newValue) async {
        if (newValue == true) {
          checkboxValueObject.checkbox = newValue!;
          await showDialog(
              context: context,
              builder: (_) => ChoiceOfTraining(checkboxValueObject));
        }
        setState(() {
          if (isChecked == true) {
            isChecked = newValue!;
          } else {}
        });
      },
      title: getData(isChecked, checkboxValueObject),
      // controlAffinity: ListTileControlAffinity.leading, // TODO: zarovnání checkBoxu na levo od textu
    );
  }

  getData(bool isChecked, CheckBoxValueObject checkboxValueObject) {
    if (isChecked == true &&
        checkboxValueObject.trainingType == TrainingType.Outside) {
      return OutsideTraining(checkboxValueObject);
    } else if (isChecked == true &&
        checkboxValueObject.trainingType == TrainingType.Online) {
      return Column(
        children: [
          OnlineTraining(checkboxValueObject),
        ],
      );
    } else {
      return null;
    }
  }
}
