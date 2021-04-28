import 'package:flutter/material.dart';
import 'rounded_button.dart';
import 'package:provider/provider.dart';
import '../constants.dart';
import 'package:e_permanentka/providers/email_sign_in.dart';

class RegistrationWithEmail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    late String name;
    late String password;
    late String email;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0),
      child: ListView(
        children: <Widget>[
          Container(
            height: 200.0,
            child: Image.asset('images/e_permanentka_transparent.png'),
          ),
          SizedBox(
            height: 48.0,
          ),
          TextField(
            style: TextStyle(
              fontFamily: 'Shadows',
              letterSpacing: 2.0,
            ),
            onChanged: (value) {
              name = value;
            },
            decoration: kTextFieldDecoration.copyWith(
              hintText: 'zadej jméno',
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          TextField(
            style: TextStyle(
              fontFamily: 'Shadows',
              letterSpacing: 2.0,
            ),
            keyboardType: TextInputType.emailAddress,
            onChanged: (value) {
              email = value;
            },
            decoration: kTextFieldDecoration.copyWith(hintText: 'zadej email'),
          ),
          SizedBox(
            height: 8.0,
          ),
          TextField(
            style: TextStyle(
              fontFamily: 'Shadows',
              letterSpacing: 2.0,
            ),
            obscureText: true,
            onChanged: (value) {
              password = value;
            },
            decoration: kTextFieldDecoration.copyWith(
              hintText: 'zadej heslo',
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          TextField(
            style: TextStyle(
              fontFamily: 'Shadows',
              letterSpacing: 2.0,
            ),
            obscureText: true,
            onChanged: (value) {
              password = value;
            },
            decoration:
                kTextFieldDecoration.copyWith(hintText: 'zadej znovu heslo'),
          ),
          SizedBox(
            height: 24.0,
          ),
          RoundedButton(
            title: 'Registrovat',
            color: Colors.deepOrange,
            onPressed: () async {
              final provider = context.read<EmailSignInProvider>();
              provider.register(email, password);
              // setState(() {
              //   showSpinner = true;
              // });
              // try {
              //   final newUser = await _auth.createUserWithEmailAndPassword(
              //       email: email, password: password);
              //   if (newUser != null) {
              //     Navigator.pushNamed(context, ListOfSeasonTicketScreen.id);
              //   }
              //   setState(() {
              //     showSpinner = false;
              //   });
              // } catch (e) {
              //   print(e);
              // }
            },
          ),
        ],
      ),
    );
  }
}
