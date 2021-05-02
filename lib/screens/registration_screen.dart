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
  late String name;
  late String password;
  bool showSpinner = false;
  // final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();

  late TextEditingController nameInputController;
  late TextEditingController emailInputController;
  late TextEditingController pwdInputController;
  late TextEditingController confirmPwdInputController;

  @override
  initState() {
    nameInputController = new TextEditingController();
    emailInputController = new TextEditingController();
    pwdInputController = new TextEditingController();
    confirmPwdInputController = new TextEditingController();
    super.initState();
  }

  String? emailValidator(String value) {
    var pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Nesporávný formát emailu';
    } else {
      return null;
    }
  }

  String? pwdValidator(String value) {
    if (value.length < 6) {
      return 'Helo musí mít minimálně 6 znaků';
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
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
