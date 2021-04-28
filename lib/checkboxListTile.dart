import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _firestore = FirebaseFirestore.instance;
User? loggedInUser;
var userId = loggedInUser?.uid;

// ignore: must_be_immutable
class FlexibleCheckboxListTile extends StatefulWidget {
  int index;

  FlexibleCheckboxListTile(this.index);

  @override
  _FlexibleCheckboxListTileState createState() =>
      _FlexibleCheckboxListTileState();
}

class _FlexibleCheckboxListTileState extends State<FlexibleCheckboxListTile> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
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
      });
    }
  }

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.now();

    return CheckboxListTile(
      activeColor: Colors.white,
      dense: true,
      value: isChecked,
      selectedTileColor: Colors.white,
      checkColor: Colors.red,
      onChanged: (newValue) {
        setState(() {
          isChecked = newValue!;
          _firestore.collection('checkBox').add({
            'user': userId,
            'checkbox': isChecked,
            'practiced': Timestamp.now(), //TODO:nemělo by tu být isChecked??
            'broadcasted': isChecked,
          });
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
              onPressed: () async {
                _selectDate(context);
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
