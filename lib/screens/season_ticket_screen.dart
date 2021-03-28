import 'package:flutter/material.dart';

class SeasonTicketScreen extends StatefulWidget {
  static const String id = 'season_ticket_screen';
  @override
  _SeasonTicketScreenState createState() => _SeasonTicketScreenState();
}

class _SeasonTicketScreenState extends State<SeasonTicketScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF15124),
      appBar: AppBar(
        title: Text(
          'ePermanentka',
          style: TextStyle(
            fontFamily: 'Shadows',
            fontSize: 20.0,
            letterSpacing: 2.5,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Text(
                'DL',
                style: TextStyle(
                  fontSize: 30.0,
                  fontFamily: 'Shadows',
                ),
              ),
              Row(
                children: [
                  // Checkbox(value: true, onChanged: )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
