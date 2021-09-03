import 'package:flutter/material.dart';
import 'package:e_permanentka/widgets/rounded_button.dart';
import '../constants.dart';

class PasswordUpdateScreen extends StatefulWidget {
  static const String id = 'password_update_screen';
  @override
  _PasswordUpdateScreenState createState() => _PasswordUpdateScreenState();
}

class _PasswordUpdateScreenState extends State<PasswordUpdateScreen> {
  @override
  Widget build(BuildContext context) {
    late String password;
    late String password1;
    late String password2;
    late String email;
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return Material(
      child: Padding(
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
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    style: TextStyle(
                      fontFamily: 'Shadows',
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.w700,
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'zadej jméno nebo přezdívku';
                      }
                      return email;
                    },
                    onChanged: (value) {
                      password = value;
                    },
                    decoration: kTextFieldDecoration.copyWith(
                      hintText: 'zadej jméno',
                      labelText: 'Jméno/přezdívka',
                      labelStyle: TextStyle(color: Colors.red),
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'zadej původní heslo';
                      }
                      return null;
                    },
                    style: TextStyle(
                      fontFamily: 'Shadows',
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.w700,
                    ),
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      email = value;
                    },
                    decoration: kTextFieldDecoration.copyWith(
                      hintText: 'zadej původní heslo',
                      labelText: 'Původní heslo',
                      labelStyle: TextStyle(color: Colors.red),
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'zadej nové heslo';
                      }
                      return null;
                    },
                    style: TextStyle(
                      fontFamily: 'Shadows',
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.w700,
                    ),
                    obscureText: true,
                    onChanged: (value) {
                      password1 = value;
                    },
                    decoration: kTextFieldDecoration.copyWith(
                      hintText: 'zadej nové heslo',
                      labelText: 'Nové heslo',
                      labelStyle: TextStyle(color: Colors.red),
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'zadej heslo';
                      }
                      return null;
                    },
                    style: TextStyle(
                        fontFamily: 'Shadows',
                        letterSpacing: 2.0,
                        fontWeight: FontWeight.w700),
                    obscureText: true,
                    onChanged: (value) {
                      password2 = value;
                    },
                    decoration: kTextFieldDecoration.copyWith(
                      hintText: 'zadej nové heslo znovu',
                      labelText: 'Potvrzení nového hesla',
                      labelStyle: TextStyle(color: Colors.red),
                    ),
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  RoundedButton(
                    title: 'Změnit heslo',
                    color: Colors.deepOrange,
                    onPressed: () async {
                      // if (password ==
                      //     loggedInUser!.updatePassword(
                      //         password1)) if (password1 == password2) {
                      //   // final provider = context.read<EmailSignInProvider>();
                      //   // provider.register(email, password1);
                      // } else {
                      //   showDialog(
                      //     context: context,
                      //     builder: (BuildContext context) {
                      //       return AlertDialog(
                      //         title: Text('AlertDialog Title'),
                      //         content: SingleChildScrollView(
                      //           child: ListBody(
                      //             children: <Widget>[
                      //               Text('heslo se neshoduje'),
                      //             ],
                      //           ),
                      //         ),
                      //         actions: <Widget>[
                      //           TextButton(
                      //             child: Text('Ok'),
                      //             onPressed: () {
                      //               Navigator.pushNamed(
                      //                   context, ListOfSeasonTicketScreen.id);
                      //             },
                      //           ),
                      //         ],
                      //       );
                      //     },
                      //   );
                      // }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
