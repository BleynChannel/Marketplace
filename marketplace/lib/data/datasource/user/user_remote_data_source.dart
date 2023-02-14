import 'package:firebase_auth/firebase_auth.dart';
import 'package:marketplace/domain/entity/media.dart';
import 'package:marketplace/domain/entity/notification.dart';
import 'package:marketplace/domain/entity/profile.dart';
import 'package:marketplace/domain/entity/status.dart';
import 'package:marketplace/presentation/debug_data.dart';

class UserRemoteDataSource {
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
