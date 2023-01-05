import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:marketplace/domain/entity/login.dart';
import 'package:marketplace/domain/entity/notification.dart';
import 'package:marketplace/domain/entity/profile.dart';
import 'package:marketplace/domain/entity/signup.dart';
import 'package:marketplace/presentation/debug_data.dart';

class UserRemoteDataSource {
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

    //TODO: Добавить регистрацию ника
  }

  Future<Profile> getProfile() async {
    return Future.value(debugProfile);
  }

  Future<List<Notification>> getNotifications() async {
    return Future.value(debugNotification);
  }
}
