import 'package:flutter/material.dart';
import '../constants.dart';
import '../value_objects/checkbox_value_object.dart';
import '../repositories/checkbox_repository.dart';
import 'package:intl/intl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:e_permanentka/value_objects/ePermanentka_value_object.dart';

final _checkboxRepository = CheckBoxRepository();
late final EPermanentkaValueObject ePermanentkaValueObject;

class OnlineTraining extends StatefulWidget {
  late CheckBoxValueObject checkboxValueObject;

  OnlineTraining(this.checkboxValueObject);

  @override
  _OnlineTrainingState createState() => _OnlineTrainingState();
}

class _OnlineTrainingState extends State<OnlineTraining> {
  DateTime selectedDate = DateTime.now();
  User? loggedInUser;

  Future<void> _selectDate(
      BuildContext context, CheckBoxValueObject checkboxValueObject) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2021),
      lastDate: DateTime(2030),
      helpText: 'vyber den',
      cancelText: 'zpět',
      confirmText: 'ok',
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;

        checkboxValueObject.practiced = DateTime.now();
        checkboxValueObject.broadcasted = selectedDate;

        _checkboxRepository.save(checkboxValueObject);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    CheckBoxValueObject checkboxValueObject = widget.checkboxValueObject;
    selectedDate = (checkboxValueObject.broadcasted != null
        ? checkboxValueObject.broadcasted
        : DateTime.now())!;
    DateTime date = (checkboxValueObject.practiced != null
        ? checkboxValueObject.practiced
        : DateTime.now())!;
    bool isChecked = checkboxValueObject.checkbox;

    return Column(
      children: [
        Row(
          children: [
            Icon(
              Icons.home_outlined,
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
                isChecked == true
                    ? 'odcvičeno ${DateFormat('d.M.y').format(date)}'
                    : 'neodcvičeno',
                style: kFontStyleRed,
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: ElevatedButton(
                child: Text(
                  isChecked == true
                      ? 'vysíláno ${DateFormat('d.M.y').format(selectedDate)}'
                      : 'neodcvičeno',
                  style: kFontStyleRed,
                  textAlign: TextAlign.start,
                ),
                onPressed: () {
                  setState(() {
                    _selectDate(context, checkboxValueObject);
                  });
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
