import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:e_permanentka/checkboxListTile.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _firestore = FirebaseFirestore.instance;
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
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    var receivedCheckboxes = [];
    _firestore
        .collection('checkBox')
        // .where('user', isEqualTo: loggedInUser?.uid)
        .orderBy('broadcasted', descending: true)
        .get()
        .then((QuerySnapshot querySnapshot) {
      var docs = querySnapshot.docs;
    });

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
                'name',
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
                  children: [
                    FlexibleCheckboxListTile(0),
                    FlexibleCheckboxListTile(1),
                    FlexibleCheckboxListTile(2),
                    FlexibleCheckboxListTile(3),
                    FlexibleCheckboxListTile(4),
                    FlexibleCheckboxListTile(5),
                    FlexibleCheckboxListTile(6),
                    FlexibleCheckboxListTile(7),
                    FlexibleCheckboxListTile(8),
                    FlexibleCheckboxListTile(9),
                    FlexibleCheckboxListTile(10),
                    FlexibleCheckboxListTile(11),
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
