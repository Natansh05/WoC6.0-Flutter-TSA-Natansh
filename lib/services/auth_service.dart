import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService{
  //Google Sign in
  signInWithGoogle() async{
    //begin interactive process
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    ///obtain auth details from the req
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    //create a new credential from user
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );
    //finally , lets sign in
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}