import 'package:e_permanentka/rounded_button.dart';
import 'package:e_permanentka/screens/list_of_season_tickets_screen.dart';
import 'package:flutter/material.dart';
import 'package:e_permanentka/screens/season_ticket_screen.dart';

// import 'package:e_permanentka/constants.dart';
// // import 'chat_screen.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:modal_progress_hud/modal_progress_hud.dart';
//
class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: 200.0,
              child: Image.asset('images/e_permanentka_transparent.png'),
            ),
            SizedBox(
              height: 48.0,
            ),
            TextField(
              onChanged: (value) {
                //Do something with the user input.
              },
              decoration: InputDecoration(
                hintText: 'Enter your email',
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepOrange, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepOrange, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              onChanged: (value) {
                //Do something with the user input.
              },
              decoration: InputDecoration(
                hintText: 'Enter your password',
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepOrange, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepOrange, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
              ),
            ),
            SizedBox(
              height: 24.0,
            ),
            RoundedButton(
              title: 'Register',
              color: Colors.deepOrange,
              onPressed: () {
                Navigator.pushNamed(context, ListOfSeasonTicketScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}

//
// class _RegistrationScreenState extends State<RegistrationScreen> {
//   // final _auth = FirebaseAuth.instance;
//   String email;
//   String password;
//   bool showSpinner = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: ModalProgressHUD(
//         inAsyncCall: showSpinner,
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 24.0),
//            child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: <Widget>[
//               Flexible(
//                 child: Hero(
//                   tag: 'logo',
//                   child: Container(
//                     height: 200.0,
//                     child: Image.asset('images/logo.png'),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 48.0,
//               ),
//               TextField(
//                 keyboardType: TextInputType.emailAddress,
//                 textAlign: TextAlign.center,
//                 onChanged: (value) {
//                   email = value; //Do something with the user input.
//                 },
//                 decoration:
//                     kTextFieldDecoration.copyWith(hintText: 'Enter your email'),
//               ),
//               SizedBox(
//                 height: 8.0,
//               ),
//               TextField(
//                 obscureText: true,
//                 textAlign: TextAlign.center,
//                 onChanged: (value) {
//                   password = value; //Do something with the user input.
//                 },
//                 decoration: kTextFieldDecoration.copyWith(
//                   hintText: 'Enter your password',
//                 ),
//               ),
//               SizedBox(
//                 height: 24.0,
//               ),
//               RoundedButton(
//                 title: 'Register',
//                 color: Colors.blueAccent,
//                 onPressed: () async {
//                   setState(() {
//                     showSpinner = true;
//                   });
//                   // try {
//                   //   final newUser = await _auth.createUserWithEmailAndPassword(
//                   //       email: email, password: password);
//                   //   if (newUser != null) {
//                   //     // Navigator.pushNamed(context, ChatScreen.id);
//                   //   }
//                   //   setState(() {
//                   //     showSpinner = false;
//                   //   });
//                   // } catch (e) {
//                   //   print(e);
//                   // }
//                   print(email);
//                   print(password);
//                 },
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }