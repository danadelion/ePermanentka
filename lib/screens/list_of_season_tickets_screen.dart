import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_permanentka/constants.dart';
import 'package:e_permanentka/providers/email_sign_in.dart';
import 'package:e_permanentka/screens/password_update_screen.dart';
import 'package:e_permanentka/screens/payment_screen.dart';
import 'package:e_permanentka/value_objects/ePermanentka_value_object.dart';
import 'package:e_permanentka/widgets/text_button_ePermanentka.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/google_sign_in.dart';

final _firestore = FirebaseFirestore.instance;

class ListOfSeasonTicketScreen extends StatefulWidget {
  static const String id = 'list_of_season_ticket_screen';
  @override
  _ListOfSeasonTicketScreenState createState() =>
      _ListOfSeasonTicketScreenState();
}

class _ListOfSeasonTicketScreenState extends State<ListOfSeasonTicketScreen> {
  var receivedPermanentky = [];
  bool isLoading = true;
  User? loggedInUser;
  final _auth = FirebaseAuth.instance;

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

  @override
  Widget build(BuildContext context) {
    User? loggedInUser = _auth.currentUser;

    if (isLoading) {
      getCurrentUser().then((value) {
        _firestore
            .collection('users')
            .doc(loggedInUser!.uid)
            .collection('ePermanentka')
            .get()
            .then(
          (QuerySnapshot querySnapshot) {
            setState(
              () {
                receivedPermanentky = querySnapshot.docs;
                isLoading = false;
              },
            );
          },
        ).onError((error, stackTrace) {
          print(error.toString());
        });
      });
      return buildLoading();
    }

    // var receivedCheckboxes = [];
    // int numberOfReceivedCheckboxes = receivedCheckboxes.length;

    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
                child: Column(
              children: [
                Text(loggedInUser!.displayName.toString(),
                    style: kFontStyleBlack),
              ],
            )),
            ListTile(
              title: Text(
                'Upravit profil',
                style: kFontStyleBlack,
              ),
              onTap: () {
                Navigator.pushNamed(context, PasswordUpdateScreen.id);
                // FirebaseFirestore.instance
                //     .collection('users')
                //     .doc(loggedInUser!.uid)
                //     .get(name);
              },
            ),
            ListTile(
              title: Text(
                'Změnit heslo',
                style: kFontStyleBlack,
              ),
              onTap: () {
                Navigator.pushNamed(context, PasswordUpdateScreen.id);
                // FirebaseFirestore.instance
                //     .collection('users')
                //     .doc(loggedInUser!.uid)
                //     .get(name);
              },
            ),
            ListTile(
              title: Text(
                'Změna hesla',
                style: kFontStyleBlack,
              ),
              onTap: () {
                // FirebaseFirestore.instance
                //     .collection('users')
                //     .doc(loggedInUser!.uid)
                //     .get(name);
                // Update the state of the app.
              },
            ),
            ListTile(
              title: Text('Odhlásit se', style: kFontStyleBlack),
              onTap: () async {
                final googleProvider = context.read<GoogleSignInProvider>();
                final emailProvider = context.read<EmailSignInProvider>();
                if (await googleProvider.isLoggedIn()) {
                  googleProvider.logout();
                }
                if (emailProvider.isLoggedIn()) {
                  emailProvider.logoutWithEmail();
                }
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Color(0xFFF15124),
        leading: null,
        title: Column(
          children: [
            Text(
              loggedInUser.displayName ?? 'unknown',
              style: kFontStyleWhiteSize20,
            ),
            Text(
              'seznam ePermanentek',
              style: kFontStyleWhiteSize20,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      backgroundColor: Color(0xFFF15124),
      body: Center(
        child: ListView(
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 20.0,
                      ),
                      receivedPermanentky.isEmpty
                          ? Text(
                              'nemáte žádnou permanentku!!',
                              textAlign: TextAlign.center,
                              style: kFontStyleBlackSize20,
                            )
                          : Column(
                              children: receivedPermanentky.map((doc) {
                                return TextButtonEPermanentka(
                                    EPermanentkaValueObject(doc!.data()!,
                                        id: doc.id));
                              }).toList(),
                            ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  onPressed: () async {
                    Navigator.pushNamed(context, PaymentScreen.id);
                  },
                  child: Icon(
                    Icons.add,
                    color: Color(0xFFF15124),
                  ),
                  backgroundColor: Colors.white,
                ),
              ],
            ),
          ],
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
