import 'package:firebase_auth/firebase_auth.dart';

abstract interface class Auth {
  Future<void> loginUser(String email, String password);
  Future<void> signUpUser();
  bool checkPresence();
}

class FirebaseAuthService implements Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseAuth get authInstance => _auth;

  @override
  bool checkPresence() {
    return _auth.currentUser != null;
  }

  @override
  Future<void> loginUser(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      //print(_auth.currentUser.toString());
      //_auth.signOut();
      //goToCountriesPage(context);
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }

  @override
  Future<void> signUpUser() {
    // TODO: implement signInUser
    throw UnimplementedError();
  }
}
