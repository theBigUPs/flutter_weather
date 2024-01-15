import 'package:firebase_auth/firebase_auth.dart';

abstract interface class Auth {
  Future<void> loginUser(String email, String password);
  Future<bool> signUpUser(String email,String password);
  bool checkPresence();
  Future<void> logOut();
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

    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }

  @override
  Future<bool> signUpUser(String email,String password) async{
    try 
    {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      print("user created");
      return true;
      
    }
    on FirebaseAuthException catch (e) 
    {
      print(e.message);
      return false;
    }
  }
  
  @override
  Future<void> logOut() async{
    try 
    {
      await _auth.signOut();
      print("user created");
      
      
    }
    on FirebaseAuthException catch (e) 
    {
      print(e.message);
      
    }
  }
}
