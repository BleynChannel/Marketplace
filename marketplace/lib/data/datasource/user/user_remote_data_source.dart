import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:marketplace/core/error/user/get_profile_failure.dart';
import 'package:marketplace/core/utils/utils.dart';
import 'package:marketplace/domain/entity/achievement.dart';
import 'package:marketplace/domain/entity/compact_product.dart';
import 'package:marketplace/domain/entity/contact.dart';
import 'package:marketplace/domain/entity/media.dart';
import 'package:marketplace/domain/entity/notification.dart';
import 'package:marketplace/domain/entity/profile.dart';
import 'package:marketplace/domain/entity/status.dart';
import 'package:marketplace/presentation/debug_data.dart';

class UserRemoteDataSource {
  Future<Profile> getProfile({required String userId}) async {
    final userDoc =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();
    if (!userDoc.exists) {
      throw const GetProfileFailure.notFound();
    }

    final userDocData = userDoc.data()!;

    final favoriteGamesDoc =
        (userDocData['favorite_games'] as List<dynamic>).map((field) => (
              field as String,
              FirebaseFirestore.instance.collection('products').doc(field).get()
            ));

    final List<CompactProduct> favoriteGames = [];
    for (final game in favoriteGamesDoc) {
      final gameData = await game.$2.then((doc) {
        if (!doc.exists) {
          throw const GetProfileFailure.productNotFound();
        }

        return doc.data()!;
      });

      gameData['id'] = game.$1;
      favoriteGames.add(CompactProduct.fromMap(gameData));
    }

    return Profile(
      id: userId,
      nickname: userDocData['nickname'] as String,
      avatar: Media(
          type: MediaType.image,
          data: await Utils.uploadImage(userDocData['avatar'] as String)),
      backgroundImage: Media(
          type: MediaType.image,
          data: await Utils.uploadImage(userDocData['background'] as String)),
      status: Status.fromMap(userDocData['status'] as Map<String, dynamic>),
      purchases: (userDocData['purchases'] as List<dynamic>).length,
      desired: (userDocData['desired'] as List<dynamic>).length,
      contacts: (await Utils.futureMap(
        userDocData['contacts'] as List<dynamic>,
        (field) async => Contact(
          name: field['name'] as String,
          icon: Media(
              type: MediaType.image,
              data: await Utils.uploadImage(field['icon'] as String)),
          url: field['url'] as String,
        ),
      ))
          .toList(),
      achievements: (await Utils.futureMap(
        userDocData['achievements'] as List<dynamic>,
        (field) async => Achievement(
          title: field['title'] as String,
          description: field['description'] as String,
          icon: Media(
              type: MediaType.image,
              data: await Utils.uploadImage(field['icon'] as String)),
        ),
      ))
          .toList(),
      favoriteGames: favoriteGames,
      registrationDate:
          (userDocData['registration_date'] as Timestamp).toDate(),
      lastActivity: (userDocData['last_activity'] as Timestamp).toDate(),
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
