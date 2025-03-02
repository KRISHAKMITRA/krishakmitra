import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn(clientId: "450198604815-hbbea4utv1veme1a6bdi2vp1ktk81stt.apps.googleusercontent.com");
  Future<UserCredential?> signInWithGoogle() async {
    try {
      // if (kIsWeb) {
      //   // Use FedCM-compatible sign-in for Web
      //   GoogleAuthProvider authProvider = GoogleAuthProvider();
      //   await _auth.signInWithRedirect(authProvider);
      // } else {
      // Use traditional Google Sign-In for mobile
      final GoogleSignInAccount? googleUser = await _googleSignIn.signInSilently();
      if (googleUser == null) return null;

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

      return await _auth.signInWithCredential(credential);
      // }
    } catch (e) {
      print("Google Sign-In Error: $e");
      return null;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
  }
}
