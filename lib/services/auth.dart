import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_auth/models/user.dart';

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Map Firebase User to UserM --this method creates a UserM object from Firebase user object
  UserM? _userfromfirebase(User user) {
    return user != null ? UserM(user.uid) : null;
  }
//login method
  Future signIn(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email.trim(), password: password.trim());
      User? user = result.user;
      return _userfromfirebase(user!);
    } on FirebaseAuthException catch (e) {
      return e.toString();
    }
  }

  //sign out
  Future signOut() async {
    return await _auth.signOut();
  }

  Future signUp(String email, String password)async{
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email.trim(), password: password.trim());
      User user = result.user!;
      return _userfromfirebase(user);
    }on FirebaseAuthException catch(e){
      return e.toString();
    }
  }

  // Stream reflecting changes in user authentication state.
  Stream<UserM?> get users {
    // Listen to authentication state changes and map them to UserM objects.
    return _auth.authStateChanges().map((user) => _userfromfirebase(user!));
  }

}
