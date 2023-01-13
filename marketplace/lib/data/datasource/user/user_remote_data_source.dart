import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:marketplace/domain/entity/login.dart';
import 'package:marketplace/domain/entity/media.dart';
import 'package:marketplace/domain/entity/notification.dart';
import 'package:marketplace/domain/entity/profile.dart';
import 'package:marketplace/domain/entity/signup.dart';
import 'package:marketplace/domain/entity/status.dart';
import 'package:marketplace/presentation/debug_data.dart';

class UserRemoteDataSource {
  //TODO: Поменять на Profile
  Future<String?> getUser() async {
    return Future.value('Bleyn');
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

  Future<Profile> getProfile({required String userId}) async {
    return Future.value(debugProfile);
  }

  Future changeProfileNickname({required String nickname}) async {
    await FirebaseAuth.instance.currentUser?.updateDisplayName(nickname);
  }

  Future changeProfilePassword({required String newPassword}) async {
    await FirebaseAuth.instance.currentUser?.updatePassword(newPassword);
  }

  Future changeProfileAvatar({required Media avatar}) async {
    //TODO: Добавить после добавления базы данных
  }

  Future changeProfileBackgroundImage({required Media backgroundImage}) async {
    //TODO: Добавить после добавления базы данных
  }

  Future changeProfileStatus({required Status status}) async {
    //TODO: Добавить после добавления базы данных
  }

  Future<List<Notification>> getNotifications() async {
    return Future.value(debugNotification);
  }
}
