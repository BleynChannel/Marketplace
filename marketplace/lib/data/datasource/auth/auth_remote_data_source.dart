import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:marketplace/domain/entity/login.dart';
import 'package:marketplace/domain/entity/signup.dart';

class AuthRemoteDataSource {
  String? getUserId() {
    return FirebaseAuth.instance.currentUser?.uid;
  }

  Future loginGoogle() async {
    final googleUser = await GoogleSignIn().signIn();
    final googleAuth = await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      idToken: googleAuth?.idToken,
      accessToken: googleAuth?.accessToken,
    );

    await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future loginGitHub() async {
    await FirebaseAuth.instance.signInWithProvider(GithubAuthProvider());
  }

  Future loginWithEmail(Login login) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: login.email,
      password: login.password,
    );
  }

  Future signUp(SignUp signUp) async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: signUp.email,
      password: signUp.password,
    );

    await FirebaseAuth.instance.currentUser!.updateDisplayName(signUp.nickname);
  }

  Future resetPassword(String email) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

  Future signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}