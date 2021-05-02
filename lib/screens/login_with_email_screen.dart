import 'package:e_permanentka/screens/list_of_season_tickets_screen.dart';
import 'package:e_permanentka/widgets/sign_in_with_email_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:e_permanentka/providers/email_sign_in.dart';

class LogInWithEmailScreen extends StatefulWidget {
  static const String id = 'login_with_email_screen';
  @override
  _LoginWithEmailScreenState createState() => _LoginWithEmailScreenState();
}

class _LoginWithEmailScreenState extends State<LogInWithEmailScreen> {
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                final emailProvider = Provider.of<EmailSignInProvider>(context);
                if (emailProvider.isSigningInWithEmail) {
                  return buildLoading();
                } else if (snapshot.hasData) {
                  return ListOfSeasonTicketScreen();
                } else {
                  return SignInWithEmailForm(emailProvider.errorMessage);
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildLoading() => Center(
        child: CircularProgressIndicator(
          strokeWidth: 6.0,
        ),
      );
}
