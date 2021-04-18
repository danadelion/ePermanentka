import 'package:e_permanentka/screens/list_of_season_tickets_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:e_permanentka/providers/email_sign_in.dart';
import 'package:e_permanentka/widgets/registration_with_email.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  late String name;
  late String password;
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    late String email;

    return Scaffold(
      backgroundColor: Colors.white,
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          final emailProvider = Provider.of<EmailSignInProvider>(context);
          if (emailProvider.isRegisteringWithEmail) {
            return buildLoading();
          } else if (snapshot.hasData) {
            return ListOfSeasonTicketScreen();
          } else {
            return RegistrationWithEmail();
          }
        },
      ),
    );
  }

  Widget buildLoading() => Center(
        child: CircularProgressIndicator(
          strokeWidth: 6.0,
        ),
      );
}
