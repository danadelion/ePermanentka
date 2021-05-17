import 'package:e_permanentka/providers/email_sign_in.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants.dart';
import 'rounded_button.dart';

class SignInWithEmailForm extends StatelessWidget {
  final String errorMessage;
  SignInWithEmailForm(this.errorMessage);

  @override
  Widget build(BuildContext context) {
    late String email = '';
    late String password = '';

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0),
      child: Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: 200.0,
              child: Image.asset('images/e_permanentka_transparent.png'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  errorMessage != '' ? Icons.warning_amber_rounded : null,
                  color: Color(0xFFF15124),
                  size: 30.0,
                ),
                Text(
                  errorMessage,
                  style: TextStyle(
                    fontFamily: 'Shadows',
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFFF15124),
                    fontSize: 19.0,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            TextField(
              style: TextStyle(
                fontFamily: 'Shadows',
                letterSpacing: 2.0,
                fontWeight: FontWeight.w700,
              ),
              onChanged: (value) {
                email = value;
              },
              keyboardType: TextInputType.emailAddress,
              decoration: kTextFieldDecoration.copyWith(
                hintText: 'zadej email',
                labelText: 'Emailová adresa',
                labelStyle: TextStyle(color: Colors.red),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              style: TextStyle(
                fontFamily: 'Shadows',
                letterSpacing: 2.0,
                fontWeight: FontWeight.w700,
              ),
              obscureText: true,
              onChanged: (value) {
                password = value;
              },
              decoration: kTextFieldDecoration.copyWith(
                hintText: 'zadej heslo',
                labelText: 'Heslo',
                labelStyle: TextStyle(color: Colors.red),
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
      ),
    );
  }
}
