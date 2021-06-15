import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_permanentka/value_objects/ePermanentka_value_object.dart';
import 'package:e_permanentka/value_objects/season_ticket_screen_arguments.dart';
import 'package:flutter/material.dart';
import 'package:e_permanentka/checkboxListTile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:e_permanentka/value_objects/checkbox_value_object.dart';
import 'package:e_permanentka/constants.dart';

final _firestore = FirebaseFirestore.instance;

class SeasonTicketScreen extends StatefulWidget {
  static const String id = 'season_ticket_screen';

  @override
  _SeasonTicketScreenState createState() => _SeasonTicketScreenState();
}

class _SeasonTicketScreenState extends State<SeasonTicketScreen> {
  final messageTextController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  var receivedCheckboxes = [];
  bool isLoading = true;
  User? loggedInUser;

  void initState() {
    super.initState();

    getCurrentUser();
  }

  Future<void> getCurrentUser() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  CheckBoxValueObject getCheckBoxData(
      EPermanentkaValueObject ePermanentkaValueObject,
      int index,
      List receivedCheckboxes) {
    CheckBoxValueObject emptyObject =
        CheckBoxValueObject(ePermanentkaValueObject, {
      'index': index,
      'user': loggedInUser!.uid,
    });

    if (receivedCheckboxes.isEmpty) {
      return emptyObject;
    }
    try {
      QueryDocumentSnapshot? doc = receivedCheckboxes.firstWhere(
        (var element) {
          return element.exists && element['index'] == index;
        },
      );
      return CheckBoxValueObject(ePermanentkaValueObject, doc!.data()!,
          id: doc.id);
    } catch (e) {
      return emptyObject;
    }
  }

  @override
  Widget build(BuildContext context) {
    final SeasonTicketScreenArguments seasonTicketScreenArguments =
        ModalRoute.of(context)!.settings.arguments
            as SeasonTicketScreenArguments;

    EPermanentkaValueObject ePermanetkaValueObject =
        seasonTicketScreenArguments.ePermanentkaValueObject;

    if (isLoading) {
      getCurrentUser().then((value) {
        _firestore
            .collection('users')
            .doc(loggedInUser!.uid)
            .collection('ePermanentka')
            .doc(ePermanetkaValueObject.id)
            .collection('checkBox')
            .get()
            .then(
          (QuerySnapshot querySnapshot) {
            setState(
              () {
                receivedCheckboxes = querySnapshot.docs;
                isLoading = false;
                // receivedCheckboxes.length;
              },
            );
          },
        ).onError((error, stackTrace) {
          print(error.toString());
        });
      });
      return buildLoading();
    }

    List<FlexibleCheckboxListTile> generateFlexibleCheckboxListTiles(
        List receivedCheckboxes,
        EPermanentkaValueObject ePermanetkaValueObject) {
      List<FlexibleCheckboxListTile> flexibleCheckboxListTiles = [];

      for (int index = 0; index < 12; index++) {
        flexibleCheckboxListTiles.add(FlexibleCheckboxListTile(getCheckBoxData(
            ePermanetkaValueObject, index, receivedCheckboxes)));
      }

      return flexibleCheckboxListTiles;
    }

    int numberOfReceivedCheckboxes = receivedCheckboxes.length;

    return Scaffold(
      backgroundColor: Color(0xFFF15124),
      appBar: AppBar(
        leading: null,
        title: Text(
          loggedInUser?.displayName ?? 'unknown',
          style: kFontStyleWhiteSize20,
        ),
        backgroundColor: Color(0xFFF15124),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'zbývá ',
                    style: kFontStyleWhite,
                  ),
                  Text(
                    '${12 - numberOfReceivedCheckboxes}',
                    style: kFontStyleBlackSize20,
                  ),
                  Text(
                    'z 12 vstupů',
                    style: kFontStyleWhite,
                  ),
                  // SizedBox(
                  //   width: 5.0,
                  // )
                ],
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
                  children: generateFlexibleCheckboxListTiles(
                      receivedCheckboxes, ePermanetkaValueObject),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildLoading() => Center(
        child: CircularProgressIndicator(
          strokeWidth: 6.0,
        ),
      );
}
