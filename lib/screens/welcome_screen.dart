import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'login_screen.dart';
import 'registration_screen.dart';
import 'package:e_permanentka/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    animation = ColorTween(begin: Color(0xFFF15124), end: Colors.white)
        .animate(controller);
    controller.forward();
    //controller.reverse (from: 1.0); zmenšuje animaci (v tom to případě zmenšuje logo)

    controller.addListener(() {
      setState(() {});
      print(animation.value);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                child: Image.asset(
                  'images/e_permanentka_transparent.png',
                ),
                height: 70.0,
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
              RoundedButton(
                title: 'Log in',
                color: Colors.orangeAccent,
                onPressed: () {
                  Navigator.pushNamed(context, LogInScreen.id);
                },
              ),
              RoundedButton(
                title: 'Register',
                color: Colors.deepOrange,
                onPressed: () {
                  Navigator.pushNamed(context, RegistrationScreen.id);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
