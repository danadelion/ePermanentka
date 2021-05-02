import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:e_permanentka/widgets/rounded_button.dart';
import 'package:e_permanentka/providers/google_sign_in.dart';
import 'package:e_permanentka/screens/login_with_email_screen.dart';
import 'package:e_permanentka/screens/registration_screen.dart';

class LogInScreen extends StatefulWidget {
  static const String id = 'log_in_screen';
  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  Container(
                    child: Image.asset(
                      'images/e_permanentka_transparent.png',
                    ),
                    height: 70.0,
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      'ePermanentka',
                      style: TextStyle(
                        fontFamily: 'Shadows',
                        fontSize: 40.0,
                        letterSpacing: 2.0,
                        color: Color(0xFFF15124),
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 48.0,
                  ),
                  Material(
                    color: Colors.lightBlueAccent,
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(30.0),
                    child: Row(
                      children: [
                        Image.asset('images/google_icon.png'),
                        Expanded(
                          child: MaterialButton(
                            onPressed: () {
                              final provider =
                                  context.read<GoogleSignInProvider>();
                              provider.login();
                            },
                            minWidth: 200.0,
                            height: 42.0,
                            child: Text(
                              'Přihlásit pomocí google účtu',
                              style: TextStyle(
                                fontFamily: 'Shadows',
                                fontSize: 20.0,
                                letterSpacing: 1.5,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  RoundedButton(
                    title: 'Přihlásit pomocí emailu',
                    color: Colors.orangeAccent,
                    onPressed: () {
                      Navigator.pushNamed(context, LogInWithEmailScreen.id);
                    },
                  ),
                  RoundedButton(
                    title: 'Registrovat',
                    color: Colors.deepOrange,
                    onPressed: () {
                      Navigator.pushNamed(context, RegistrationScreen.id);
                    },
                  ),
                  // SizedBox(
                  //   height: 128.0,
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
