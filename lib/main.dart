import 'package:e_permanentka/screens/list_of_season_tickets_screen.dart';
import 'package:flutter/material.dart';
import 'screens/season_ticket_screen.dart';
import 'screens/login_screen.dart';
import 'screens/registration_screen.dart';
import 'screens/welcome_screen.dart';
import 'screens/list_of_season_tickets_screen.dart';

void main() {
  runApp(EPermanentka());
}

class EPermanentka extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: WelcomeScreen.id, routes: {
      WelcomeScreen.id: (context) => WelcomeScreen(),
      LogInScreen.id: (context) => LogInScreen(),
      RegistrationScreen.id: (context) => RegistrationScreen(),
      SeasonTicketScreen.id: (context) => SeasonTicketScreen(),
      ListOfSeasonTicketScreen.id: (context) => ListOfSeasonTicketScreen(),
    });
  }
}

// backgroundColor: Color(0xFFF15124),
