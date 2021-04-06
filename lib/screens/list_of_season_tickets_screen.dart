import 'package:e_permanentka/main.dart';
import 'package:e_permanentka/screens/season_ticket_screen.dart';
import 'package:flutter/material.dart';

class ListOfSeasonTicketScreen extends StatefulWidget {
  static const String id = 'list_of_season_ticket_screen';
  @override
  _ListOfSeasonTicketScreenState createState() =>
      _ListOfSeasonTicketScreenState();
}

class _ListOfSeasonTicketScreenState extends State<ListOfSeasonTicketScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF15124),
        title: Text(
          'nickName',
          style: TextStyle(
            fontFamily: 'Shadows',
            fontSize: 20.0,
            letterSpacing: 2.5,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      backgroundColor: Color(0xFFF15124),
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20.0,
              ),
              Text(
                'seznam ePermanentek',
                style: TextStyle(
                  fontFamily: 'Shadows',
                  fontSize: 20.0,
                  letterSpacing: 3.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                child: Divider(
                  color: Colors.black,
                ),
                height: 25.0,
                width: 250.0,
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, SeasonTicketScreen.id);
                    },
                    child: Row(
                      children: [
                        Text('ePermanentka č. 1'),
                      ],
                    ),
                  ),
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
