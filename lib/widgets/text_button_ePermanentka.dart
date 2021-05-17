import 'package:e_permanentka/screens/season_ticket_screen.dart';
import 'package:flutter/material.dart';

class TextButtonEPermanentka extends StatefulWidget {
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
        Navigator.pushNamed(context, SeasonTicketScreen.id);
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
