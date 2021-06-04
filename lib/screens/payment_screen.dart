import 'package:e_permanentka/screens/list_of_season_tickets_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:e_permanentka/repositories/ePermanentka_repository.dart';
import 'package:e_permanentka/value_objects/ePermanentka_value_object.dart';

class PaymentScreen extends StatefulWidget {
  static const String id = 'payment_screen';

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final EPermanentkaRepository _ePermanentkaRepository =
      EPermanentkaRepository();
  var receivedEPermanentka = [];
  bool isLoading = true;
  final _auth = FirebaseAuth.instance;
  User? loggedInUser;

  @override
  Widget build(BuildContext context) {
    loggedInUser = _auth.currentUser;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          color: Colors.blue,
          child: TextButton(
            child: Text(
              'platba za permanentku',
              style: TextStyle(color: Colors.black),
            ),
            onPressed: () async {
              await _ePermanentkaRepository
                  .save(EPermanentkaValueObject({'user': loggedInUser!.uid}));
              Navigator.pushNamed(context, ListOfSeasonTicketScreen.id);
            },
          ),
        ),
      ],
    );
  }
}
