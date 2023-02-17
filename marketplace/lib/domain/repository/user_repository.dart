import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:marketplace/core/error/user/change_language_failure.dart';
import 'package:marketplace/core/error/user/change_profile_avatar_failure.dart';
import 'package:marketplace/core/error/user/change_profile_background_image_failure.dart';
import 'package:marketplace/core/error/user/change_profile_nickname_failure.dart';
import 'package:marketplace/core/error/user/change_profile_password_failure.dart';
import 'package:marketplace/core/error/user/change_profile_status_failure.dart';
import 'package:marketplace/core/error/user/init_failure.dart';
import 'package:marketplace/core/error/user/get_notifications_failure.dart';
import 'package:marketplace/core/error/user/get_profile_failure.dart';
import 'package:marketplace/data/datasource/user/user_local_data_source.dart';
import 'package:marketplace/data/datasource/user/user_remote_data_source.dart';
import 'package:marketplace/domain/entity/media.dart';
import 'package:marketplace/domain/entity/notification.dart';
import 'package:marketplace/domain/entity/profile.dart';
import 'package:marketplace/domain/entity/status.dart';

class UserRepository {
  final UserLocalDataSource localDataSource;
  final UserRemoteDataSource remoteDataSource;

  final rxLanguage = ''.obs;
  String get language => rxLanguage.value;

  UserRepository(this.localDataSource, this.remoteDataSource) {
    try {
      localDataSource.getLanguage().then((value) => rxLanguage.value = value);
    } finally {}
  }

  Future<Either<InitFailure, void>> init() async {
    try {
      rxLanguage.value = await localDataSource.getLanguage();
      return const Right(null);
    } catch (_) {
      return const Left(InitFailure.unknown());
    }
  }

  Future<Either<GetProfileFailure, Profile>> getProfile(
      {required String userId}) async {
    try {
      final result = await remoteDataSource.getProfile(userId: userId);
      return Right(result);
    } catch (_) {
      return const Left(GetProfileFailure.unknown());
    }
  }

  Future<Either<ChangeProfileNicknameFailure, void>> changeProfileNickname(
      {required String nickname}) async {
    try {
      await remoteDataSource.changeProfileNickname(nickname: nickname);
      return const Right(null);
    } catch (_) {
      return const Left(ChangeProfileNicknameFailure.unknown());
    }
  }

  Future<Either<ChangeProfilePasswordFailure, void>> changeProfilePassword(
      {required String newPassword}) async {
    try {
      await remoteDataSource.changeProfilePassword(newPassword: newPassword);
      return const Right(null);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'weak-password':
          return const Left(ChangeProfilePasswordFailure.weakPassword());
        case 'requires-recent-login':
          return const Left(ChangeProfilePasswordFailure.requiresRecentLogin());
        default:
          return const Left(ChangeProfilePasswordFailure.unknown());
      }
    } catch (_) {
      return const Left(ChangeProfilePasswordFailure.unknown());
    }
  }

  Future<Either<ChangeProfileAvatarFailure, void>> changeProfileAvatar(
      {required Media avatar}) async {
    try {
      await remoteDataSource.changeProfileAvatar(avatar: avatar);
      return const Right(null);
    } catch (_) {
      return const Left(ChangeProfileAvatarFailure.unknown());
    }
  }

  Future<Either<ChangeProfileBackgroundImageFailure, void>>
      changeProfileBackgroundImage({required Media backgroundImage}) async {
    try {
      await remoteDataSource.changeProfileBackgroundImage(
          backgroundImage: backgroundImage);
      return const Right(null);
    } catch (_) {
      return const Left(ChangeProfileBackgroundImageFailure.unknown());
    }
  }

  Future<Either<ChangeProfileStatusFailure, void>> changeProfileStatus(
      {required Status status}) async {
    try {
      await remoteDataSource.changeProfileStatus(status: status);
      return const Right(null);
    } catch (_) {
      return const Left(ChangeProfileStatusFailure.unknown());
    }
  }

  Future<Either<ChangeLanguageFailure, void>> changeLanguage(
      {required String language}) async {
    try {
      await localDataSource.changeLanguage(language: language);
      rxLanguage.value = language;
      return const Right(null);
    } catch (_) {
      return const Left(ChangeLanguageFailure.unknown());
    }
  }

  Future<Either<GetNotificationsFailure, List<Notification>>>
      getNotifications() async {
    try {
      final result = await remoteDataSource.getNotifications();
      return Right(result);
    } catch (_) {
      return const Left(GetNotificationsFailure.unknown());
    }
  }
}
