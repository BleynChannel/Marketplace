import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:marketplace/core/error/user/get_profile_failure.dart';
import 'package:marketplace/core/utils/utils.dart';
import 'package:marketplace/data/utils/firebase_utils.dart';
import 'package:marketplace/domain/entity/achievement.dart';
import 'package:marketplace/domain/entity/contact.dart';
import 'package:marketplace/domain/entity/media.dart';
import 'package:marketplace/domain/entity/notification.dart';
import 'package:marketplace/domain/entity/profile.dart';
import 'package:marketplace/domain/entity/status.dart';
import 'package:marketplace/presentation/debug_data.dart';

class UserRemoteDataSource {
  Future<Profile> getProfile({required String userId}) async {
    final user = FirebaseFirestore.instance.collection('users').doc(userId);
    final userDoc = await user.get();
    if (!userDoc.exists) {
      throw const GetProfileFailure.notFound();
    }

    final userData = userDoc.data()!;

    return Profile(
      id: userId,
      nickname: userData['nickname'] as String,
      avatar: Media(
          type: MediaType.image,
          data: await FirebaseUtils.loadImage(userData['avatar'] as String)),
      backgroundImage: Media(
          type: MediaType.image,
          data:
              await FirebaseUtils.loadImage(userData['background'] as String)),
      status: Status.fromMap(userData['status'] as Map<String, dynamic>),
      purchases: (userData['purchases'] as List<dynamic>).length,
      desired: (userData['desired'] as List<dynamic>).length,
      contacts: (await Utils.futureMap(
        await user.collection('contacts').get().then((c) => c.docs),
        (doc) async {
          final data = doc.data();
          return Contact(
            name: doc.id,
            icon: await Utils.getMediaImage(
                Utils.contactsToPathToSvgIcons(doc.id)),
            url: data['url'] as String,
          );
        },
      ))
          .toList(),
      achievements: (await Utils.futureMap(
        userData['achievements'] as List<dynamic>,
        (field) async {
          final data = await (field as DocumentReference)
              .get()
              .then((doc) => doc.data() as Map<String, dynamic>);
          data['icon'] = await FirebaseUtils.loadImage(data['icon'] as String);
          return Achievement.fromMap(data);
        },
      ))
          .toList(),
      favoriteGames: (await Utils.futureMap(
        userData['favorite_games'] as List<dynamic>,
        (field) async => FirebaseUtils.packProduct(field),
      ))
          .toList(),
      registrationDate: (userData['registration_date'] as Timestamp).toDate(),
      lastActivity: (userData['last_activity'] as Timestamp).toDate(),
    );
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
