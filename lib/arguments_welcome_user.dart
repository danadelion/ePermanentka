import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ArgumentsWelcomeUser {
  late User user;
  late GoogleSignIn googleSignIn;

  ArgumentsWelcomeUser(this.user, this.googleSignIn);
}
