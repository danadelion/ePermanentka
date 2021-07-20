import 'package:flutter/material.dart';
import '../constants.dart';
import '../value_objects/checkbox_value_object.dart';
import 'package:intl/intl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:e_permanentka/value_objects/ePermanentka_value_object.dart';

late final EPermanentkaValueObject ePermanentkaValueObject;

class OutsideTraining extends StatefulWidget {
  late CheckboxValueObject checkboxValueObject;

  OutsideTraining(this.checkboxValueObject);

  @override
  _OutsideTrainingState createState() => _OutsideTrainingState();
}

class _OutsideTrainingState extends State<OutsideTraining> {
  DateTime selectedDate = DateTime.now();
  User? loggedInUser;

  @override
  Widget build(BuildContext context) {
    CheckboxValueObject checkboxValueObject = widget.checkboxValueObject;
    selectedDate = (checkboxValueObject.broadcasted != null
        ? checkboxValueObject.broadcasted
        : DateTime.now())!;
    DateTime date = (checkboxValueObject.practiced != null
        ? checkboxValueObject.practiced
        : DateTime.now())!;
    // bool isChecked = checkboxValueObject.checkbox;

    return Row(
      children: [
        Icon(
          Icons.nature_people_outlined,
          color: Colors.black87,
        ),
        Container(
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 3.0, color: Color(0xFFF15124)),
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
          ),
          child: Text(
            'odcvičeno ${DateFormat('d.M.y').format(date)}',
            // isChecked == true
            //     ? 'odcvičeno ${DateFormat('d.M.y').format(date)}'
            //     : 'neodcvičeno',
            style: kFontStyleRed,
            textAlign: TextAlign.start,
          ),
        ),
      ],
    );
  }
}
