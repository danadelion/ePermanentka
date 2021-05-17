import 'package:e_permanentka/repositories/checkbox_repository.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'value_objects/checkbox_value_object.dart';

final _firestore = FirebaseFirestore.instance;
final _checkboxRepository = CheckBoxRepository();

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
  final _auth = FirebaseAuth.instance;
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
      // initialEntryMode: DatePickerEntryMode.input,
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;

        checkboxValueObject.practiced = DateTime.now();
        checkboxValueObject.broadcasted = selectedDate;

        _checkboxRepository.save(checkboxValueObject);

        // _firestore
        //     .collection('users')
        //     .doc(userId)
        //     .collection('checkBox')
        //     .doc(checkboxData!.index.toString())
        //     .update({
        //   // 'index': widget.index,
        //   // 'checkbox': isChecked,
        //   // 'practiced': Timestamp.now(),
        //   "broadcasted": selectedDate,
        // });
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

    return CheckboxListTile(
      activeColor: Colors.white,
      dense: true,
      value: isChecked,
      selectedTileColor: Colors.white,
      checkColor: Colors.red,
      onChanged: (newValue) async {
        checkboxValueObject.checkbox = newValue!;
        await _checkboxRepository.save(checkboxValueObject);
        setState(() {
          isChecked = newValue;
        });
      },
      title: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10.0),
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
              style: TextStyle(
                color: Colors.red,
                fontFamily: 'Shadows',
                letterSpacing: 2,
              ),
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
                    ? 'vysíláno online ${DateFormat('d.M.y').format(selectedDate)}'
                    : 'neodcvičeno',
                style: TextStyle(
                  color: Colors.red,
                  fontFamily: 'Shadows',
                  letterSpacing: 2,
                ),
                textAlign: TextAlign.start,
              ),
              onPressed: () {
                setState(() {
                  _selectDate(context, checkboxValueObject);
                  // _firestore
                  //     .collection('users')
                  //     .doc(userId)
                  //     .collection('checkBox')
                  //     .doc(checkboxValueObject.id)
                  //     .update({
                  //   // 'index': widget.index,
                  //   // 'checkbox': isChecked,
                  //   // 'practiced': Timestamp.now(),
                  //   "broadcasted": selectedDate,
                  // });
                });
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
              ),
            ),
          ),
        ],
      ),
      controlAffinity: ListTileControlAffinity.leading,
    );
  }
}
