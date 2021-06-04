import 'package:e_permanentka/providers/google_sign_in.dart';
import 'package:e_permanentka/screens/log_in_screen.dart';
import 'package:e_permanentka/screens/list_of_season_tickets_screen.dart';
import 'package:e_permanentka/screens/payment_screen.dart';
import 'package:flutter/material.dart';
import 'screens/season_ticket_screen.dart';
import 'screens/login_with_email_screen.dart';
import 'screens/registration_screen.dart';
import 'screens/welcome_screen.dart';
import 'screens/list_of_season_tickets_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:e_permanentka/providers/email_sign_in.dart';
import 'screens/payment_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => GoogleSignInProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => EmailSignInProvider(),
        )
      ],
      child: EPermanentka(),
    ),
  );
}

class EPermanentka extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: WelcomeScreen.id, routes: {
      WelcomeScreen.id: (context) => WelcomeScreen(),
      LogInWithEmailScreen.id: (context) => LogInWithEmailScreen(),
      RegistrationScreen.id: (context) => RegistrationScreen(),
      SeasonTicketScreen.id: (context) => SeasonTicketScreen(),
      ListOfSeasonTicketScreen.id: (context) => ListOfSeasonTicketScreen(),
      LogInScreen.id: (context) => LogInScreen(),
      PaymentScreen.id: (context) => PaymentScreen(),
    });
  }
}

// backgroundColor: Color(0xFFF15124),
