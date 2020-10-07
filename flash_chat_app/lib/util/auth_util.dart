import 'package:firebase_auth/firebase_auth.dart';

class AuthUtil {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User getCurrentUser() {
    try {
      final user = _auth.currentUser;

      if (user != null) {
        return user;
      }

      return null;

    } catch (error) {
      print(error);
    }
  }
}
