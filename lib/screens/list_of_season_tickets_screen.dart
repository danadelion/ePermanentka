import 'package:e_permanentka/providers/email_sign_in.dart';
import 'package:e_permanentka/widgets/text_button_ePermanentka.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/google_sign_in.dart';

class ListOfSeasonTicketScreen extends StatefulWidget {
  static const String id = 'list_of_season_ticket_screen';

  @override
  _ListOfSeasonTicketScreenState createState() =>
      _ListOfSeasonTicketScreenState();
}

class _ListOfSeasonTicketScreenState extends State<ListOfSeasonTicketScreen> {
  @override
  Widget build(BuildContext context) {
    // final _auth = FirebaseAuth.instance;
    // User? loggedInUser = _auth.currentUser;

    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(child: Text('A')),
            ListTile(
              title: Text('Upravit profil'),
              onTap: () {
                // Update the state of the app.
              },
            ),
            ListTile(
              title: Text('Změna hesla'),
              onTap: () {
                // FirebaseFirestore.instance
                //     .collection('users')
                //     .doc(loggedInUser!.uid)
                //     .get(name);
                // Update the state of the app.
              },
            ),
            ListTile(
              title: Text('Odhlásit se'),
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
              'nickName',
              style: TextStyle(
                fontFamily: 'Shadows',
                fontSize: 20.0,
                letterSpacing: 2.5,
                fontWeight: FontWeight.w700,
              ),
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
                  Column(
                    children: [TextButtonEPermanentka()],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  onPressed: () {},
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
}
