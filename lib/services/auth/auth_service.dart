import 'package:firebase_auth/firebase_auth.dart';
class AuthService{

  //get Instance of firebase auth
final FirebaseAuth _firebaseAuth= FirebaseAuth.instance;

//get current user
User?getCurrentUser(){
  return _firebaseAuth.currentUser;
}

//signIn
Future<UserCredential> signInWithEmailPassword(String email,password) async{
  //try sign in
  try{
    UserCredential userCredential =
        await _firebaseAuth.signInWithEmailAndPassword(
            email: email,
            password: password
        );
    return userCredential;
  }
  //catch any error
  on FirebaseAuthException catch(e){
    throw Exception(e.code);
  }

}

//signout

  Future<void> signOut() async{
  return await _firebaseAuth.signOut();

  }


// sign up
  Future<UserCredential> signUpWithEmailPassword(String email,password) async{
    //try sign up
    try{
      UserCredential userCredential =
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email,
          password: password
      );
      return userCredential;
    }
    //catch any error
    on FirebaseAuthException catch(e){
      throw Exception(e.code);
    }

  }
}