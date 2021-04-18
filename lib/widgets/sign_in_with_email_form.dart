import 'package:e_permanentka/providers/email_sign_in.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants.dart';
import 'rounded_button.dart';

class SignInWithEmailForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    late String email;
    late String password;

    return Padding(
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
            style: TextStyle(
              fontFamily: 'Shadows',
              letterSpacing: 2.0,
            ),
            onChanged: (value) {
              email = value;
            },
            keyboardType: TextInputType.emailAddress,
            decoration: kTextFieldDecoration.copyWith(
              hintText: 'Enter your email',
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
            decoration: kTextFieldDecoration.copyWith(
              hintText: 'Enter your password',
            ),
          ),
          SizedBox(
            height: 24.0,
          ),
          RoundedButton(
            title: 'Log In',
            color: Colors.orangeAccent,
            onPressed: () {
              final provider = context.read<EmailSignInProvider>();
              provider.loginWithEmail(email, password);
            },
          ),
        ],
      ),
    );
  }
}
