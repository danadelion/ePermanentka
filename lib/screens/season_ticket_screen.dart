import 'package:flutter/material.dart';
import 'package:e_permanentka/checkboxListTile.dart';
import 'package:firebase_auth/firebase_auth.dart';

User? loggedInUser;

class SeasonTicketScreen extends StatefulWidget {
  static const String id = 'season_ticket_screen';
  @override
  _SeasonTicketScreenState createState() => _SeasonTicketScreenState();
}

class _SeasonTicketScreenState extends State<SeasonTicketScreen> {
  final messageTextController = TextEditingController();
  final _auth = FirebaseAuth.instance;

  void initState() {
    super.initState();

    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser!.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF15124),
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                _auth.signOut();
                Navigator.pop(context);
              }),
        ],
        title: Text(
          'ePermanentka na 12 vstupů',
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
              SizedBox(
                child: Divider(
                  color: Colors.black,
                ),
                height: 25.0,
                width: 250.0,
              ),
              Expanded(
                child: ListView(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FlexibleCheckboxListTile(),
                    FlexibleCheckboxListTile(),
                    FlexibleCheckboxListTile(),
                    FlexibleCheckboxListTile(),
                    FlexibleCheckboxListTile(),
                    FlexibleCheckboxListTile(),
                    FlexibleCheckboxListTile(),
                    FlexibleCheckboxListTile(),
                    FlexibleCheckboxListTile(),
                    FlexibleCheckboxListTile(),
                    FlexibleCheckboxListTile(),
                    FlexibleCheckboxListTile(),
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
