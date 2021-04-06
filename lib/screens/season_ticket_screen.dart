import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SeasonTicketScreen extends StatefulWidget {
  static const String id = 'season_ticket_screen';
  @override
  _SeasonTicketScreenState createState() => _SeasonTicketScreenState();
}

class _SeasonTicketScreenState extends State<SeasonTicketScreen> {
  bool? isChecked = false;

  @override
  Widget build(BuildContext context) {
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

    return Scaffold(
      backgroundColor: Color(0xFFF15124),
      appBar: AppBar(
        title: Text(
          'ePermanentka č.1',
          style: TextStyle(
            fontFamily: 'Shadows',
            fontSize: 20.0,
            letterSpacing: 2.5,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: Color(0xFFF15124),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Text(
                'nickName',
                style: TextStyle(
                  fontSize: 30.0,
                  fontFamily: 'Shadows',
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: CheckboxListTile(
                        activeColor: Colors.orangeAccent,
                        value: isChecked,
                        selectedTileColor: Colors.red,
                        onChanged: (newValue) {
                          setState(() {
                            isChecked = newValue;
                          });
                        },
                        title: ElevatedButton(
                          child: Text(
                            DateFormat('d.M.y').format(selectedDate),
                            style: TextStyle(color: Colors.red),
                            textAlign: TextAlign.start,
                          ),
                          onPressed: () async {
                            _selectDate(context);
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                          ),
                        ),
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
