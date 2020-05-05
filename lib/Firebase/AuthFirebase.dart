import 'package:anilquizapp/Firebase/FirebaseDatabase.dart';
import 'package:anilquizapp/Firebase/User.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future signInAnnOn() async {
    try{
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return user;
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  User _userFromFireBaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  Future signWithUser(email,password ) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;

      //create new collection
      await DataBaseService(uid: user.uid).updateUserData("100", "Anil");
      return _userFromFireBaseUser(user);
    } catch(e){
      print(e.toString());
      return null;
    }
  }

  Future signUp(email,password) async {
    try {
     AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
     FirebaseUser user = result.user;
     return _userFromFireBaseUser(user);
    } catch(e){
      print(e.toString());
      return null;
    }
  }

  Stream<User> get user{
    return _auth.onAuthStateChanged.map(_userFromFireBaseUser);
  }

  Future signOut() async {
    try {
      return await  _auth.signOut();
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

}
