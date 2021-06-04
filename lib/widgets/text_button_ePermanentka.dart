import 'package:e_permanentka/screens/season_ticket_screen.dart';
import 'package:e_permanentka/value_objects/ePermanentka_value_object.dart';
import 'package:e_permanentka/value_objects/season_ticket_screen_arguments.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextButtonEPermanentka extends StatefulWidget {
  EPermanentkaValueObject ePermanentkaValueObject;

  TextButtonEPermanentka(this.ePermanentkaValueObject);

  @override
  _TextButtonEPermanentkaState createState() => _TextButtonEPermanentkaState();
}

class _TextButtonEPermanentkaState extends State<TextButtonEPermanentka> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.white),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
            side: BorderSide(color: Colors.red),
          ),
        ),
      ),
      onPressed: () {
        Navigator.pushNamed(context, SeasonTicketScreen.id,
            arguments:
                SeasonTicketScreenArguments(widget.ePermanentkaValueObject));
      },
      child: Text(
        '  ePermanentka 12 vstupů   ',
        style: TextStyle(
          fontFamily: 'Shadows',
          fontSize: 15.0,
          color: Color(0xFFF15124),
          fontWeight: FontWeight.bold,
          letterSpacing: 3.0,
        ),
      ),
    );
  }
}
