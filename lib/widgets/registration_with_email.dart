import 'package:flutter/material.dart';
import 'rounded_button.dart';
import 'package:provider/provider.dart';
import '../constants.dart';
import 'package:e_permanentka/providers/email_sign_in.dart';

class RegistrationWithEmail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    late String name;
    late String password1;
    late String password2;
    late String email;
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                    return null;
                  },
                  onChanged: (value) {
                    name = value;
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
                      return 'zadej email';
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
                    hintText: 'zadej email',
                    labelText: 'Emailová adresa',
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
                    fontWeight: FontWeight.w700,
                  ),
                  obscureText: true,
                  onChanged: (value) {
                    password1 = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: 'zadej heslo',
                    labelText: 'Heslo',
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
                    hintText: 'zadej heslo znovu',
                    labelText: 'Potvrzení hesla',
                    labelStyle: TextStyle(color: Colors.red),
                  ),
                ),
                SizedBox(
                  height: 24.0,
                ),
                RoundedButton(
                  title: 'Registrovat',
                  color: Colors.deepOrange,
                  onPressed: () async {
                    if (password1 == password2) {
                      final provider = context.read<EmailSignInProvider>();
                      provider.register(name, email, password1);
                    } else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('AlertDialog Title'),
                            content: SingleChildScrollView(
                              child: ListBody(
                                children: <Widget>[
                                  Text('heslo se neshoduje'),
                                ],
                              ),
                            ),
                            actions: <Widget>[
                              TextButton(
                                child: Text('Ok'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//
// void inputData() {
//   final User user = auth.currentUser!;
//   final uid = user.uid;
//   // here you write the codes to input the data into firestore
//   FirebaseFirestore.instance.collection('users').doc(user!.uid).setData({
//     "uid": user!.uid,
//     "firstName": name,
//     "email": email,
//     "password": password,
//   });}
