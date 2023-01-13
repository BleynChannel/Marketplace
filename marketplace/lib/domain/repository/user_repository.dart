import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:marketplace/core/error/user/change_profile_avatar_failure.dart';
import 'package:marketplace/core/error/user/change_profile_background_image_failure.dart';
import 'package:marketplace/core/error/user/change_profile_nickname_failure.dart';
import 'package:marketplace/core/error/user/change_profile_password_failure.dart';
import 'package:marketplace/core/error/user/change_profile_status_failure.dart';
import 'package:marketplace/core/error/user/get_notifications_failure.dart';
import 'package:marketplace/core/error/user/get_profile_failure.dart';
import 'package:marketplace/core/error/user/get_user_failure.dart';
import 'package:marketplace/core/error/user/login_github_failure.dart';
import 'package:marketplace/core/error/user/login_google_failure.dart';
import 'package:marketplace/core/error/user/login_with_email_failure.dart';
import 'package:marketplace/core/error/user/reset_password_failure.dart';
import 'package:marketplace/core/error/user/sign_out_failure.dart';
import 'package:marketplace/core/error/user/signup_failure.dart';
import 'package:marketplace/data/datasource/user/user_remote_data_source.dart';
import 'package:marketplace/domain/entity/login.dart';
import 'package:marketplace/domain/entity/media.dart';
import 'package:marketplace/domain/entity/notification.dart';
import 'package:marketplace/domain/entity/profile.dart';
import 'package:marketplace/domain/entity/signup.dart';
import 'package:marketplace/domain/entity/status.dart';

class UserRepository {
  final _remoteDataSource = UserRemoteDataSource();

  //TODO: Поменять на Profile
  Future<Either<GetUserFailure, String?>> getUser() async {
    try {
      final result = await _remoteDataSource.getUser();
      return Right(result);
    } catch (_) {
      return const Left(GetUserFailure.unknown());
    }
  }

  Future<Either<LoginGoogleFailure, void>> loginGoogle() async {
    try {
      await _remoteDataSource.loginGoogle();
      return const Right(null);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'network-request-failed':
          return const Left(LoginGoogleFailure.networkRequestFailed());
        case 'account-exists-with-different-credential':
          return const Left(
              LoginGoogleFailure.accountExistsWithDifferentCredential());
        case 'invalid-credential':
          return const Left(LoginGoogleFailure.invalidCredential());
        case 'operation-not-allowed':
          return const Left(LoginGoogleFailure.operationNotAllowed());
        case 'user-disabled':
          return const Left(LoginGoogleFailure.userDisabled());
        case 'user-not-found':
          return const Left(LoginGoogleFailure.userNotFound());
        case 'wrong-password':
          return const Left(LoginGoogleFailure.wrongPassword());
        case 'invalid-verification-code':
          return const Left(LoginGoogleFailure.invalidVerificationCode());
        case 'invalid-verification-id':
          return const Left(LoginGoogleFailure.invalidVerificationId());
        default:
          return const Left(LoginGoogleFailure.unknown());
      }
    } catch (_) {
      return const Left(LoginGoogleFailure.unknown());
    }
  }

  Future<Either<LoginGitHubFailure, void>> loginGitHub() async {
    try {
      await _remoteDataSource.loginGitHub();
      return const Right(null);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'network-request-failed':
          return const Left(LoginGitHubFailure.networkRequestFailed());
        case 'user-disabled':
          return const Left(LoginGitHubFailure.userDisabled());
        default:
          return const Left(LoginGitHubFailure.unknown());
      }
    } catch (_) {
      return const Left(LoginGitHubFailure.unknown());
    }
  }

  Future<Either<LoginWithEmailFailure, void>> loginWithEmail(
      Login login) async {
    try {
      await _remoteDataSource.loginWithEmail(login);
      return const Right(null);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'network-request-failed':
          return const Left(LoginWithEmailFailure.networkRequestFailed());
        case 'invalid-email':
          return const Left(LoginWithEmailFailure.invalidEmail());
        case 'user-disabled':
          return const Left(LoginWithEmailFailure.userDisabled());
        case 'user-not-found':
          return const Left(LoginWithEmailFailure.userNotFound());
        case 'wrong-password':
          return const Left(LoginWithEmailFailure.wrongPassword());
        default:
          return const Left(LoginWithEmailFailure.unknown());
      }
    } catch (_) {
      return const Left(LoginWithEmailFailure.unknown());
    }
  }

  Future<Either<SignUpFailure, void>> signUp(SignUp signUp) async {
    try {
      await _remoteDataSource.signUp(signUp);
      return const Right(null);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'network-request-failed':
          return const Left(SignUpFailure.networkRequestFailed());
        case 'email-already-in-use':
          return const Left(SignUpFailure.emailAlreadyInUse());
        case 'invalid-email':
          return const Left(SignUpFailure.invalidEmail());
        case 'operation-not-allowed':
          return const Left(SignUpFailure.operationNotAllowed());
        case 'weak-password':
          return const Left(SignUpFailure.weakPassword());
        default:
          return const Left(SignUpFailure.unknown());
      }
    } catch (_) {
      return const Left(SignUpFailure.unknown());
    }
  }

  Future<Either<ResetPasswordFailure, void>> resetPassword(String email) async {
    try {
      await _remoteDataSource.resetPassword(email);
      return const Right(null);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'network-request-failed':
          return const Left(ResetPasswordFailure.networkRequestFailed());
        case 'invalid-email':
          return const Left(ResetPasswordFailure.invalidEmail());
        case 'missing-android-pkg-name':
          return const Left(ResetPasswordFailure.missingAndroidPkgName());
        case 'missing-continue-uri':
          return const Left(ResetPasswordFailure.missingContinueUri());
        case 'missing-ios-bundle-id':
          return const Left(ResetPasswordFailure.missingIosBundleId());
        case 'invalid-continue-uri':
          return const Left(ResetPasswordFailure.invalidContinueUri());
        case 'unauthorized-continue-uri':
          return const Left(ResetPasswordFailure.unauthorizedContinueUri());
        case 'user-not-found':
          return const Left(ResetPasswordFailure.userNotFound());
        default:
          return const Left(ResetPasswordFailure.unknown());
      }
    } catch (_) {
      return const Left(ResetPasswordFailure.unknown());
    }
  }

  Future<Either<SignOutFailure, void>> signOut() async {
    try {
      await _remoteDataSource.signOut();
      return const Right(null);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'network-request-failed':
          return const Left(SignOutFailure.networkRequestFailed());
        default:
          return const Left(SignOutFailure.unknown());
      }
    } catch (_) {
      return const Left(SignOutFailure.unknown());
    }
  }

  Future<Either<GetProfileFailure, Profile>> getProfile(
      {required String userId}) async {
    try {
      final result = await _remoteDataSource.getProfile(userId: userId);
      return Right(result);
    } catch (_) {
      return const Left(GetProfileFailure.unknown());
    }
  }

  Future<Either<ChangeProfileNicknameFailure, void>> changeProfileNickname(
      {required String nickname}) async {
    try {
      await _remoteDataSource.changeProfileNickname(nickname: nickname);
      return const Right(null);
    } catch (_) {
      return const Left(ChangeProfileNicknameFailure.unknown());
    }
  }

  Future<Either<ChangeProfilePasswordFailure, void>> changeProfilePassword(
      {required String newPassword}) async {
    try {
      await _remoteDataSource.changeProfilePassword(newPassword: newPassword);
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
      await _remoteDataSource.changeProfileAvatar(avatar: avatar);
      return const Right(null);
    } catch (_) {
      return const Left(ChangeProfileAvatarFailure.unknown());
    }
  }

  Future<Either<ChangeProfileBackgroundImageFailure, void>>
      changeProfileBackgroundImage({required Media backgroundImage}) async {
    try {
      await _remoteDataSource.changeProfileBackgroundImage(
          backgroundImage: backgroundImage);
      return const Right(null);
    } catch (_) {
      return const Left(ChangeProfileBackgroundImageFailure.unknown());
    }
  }

  Future<Either<ChangeProfileStatusFailure, void>> changeProfileStatus(
      {required Status status}) async {
    try {
      await _remoteDataSource.changeProfileStatus(status: status);
      return const Right(null);
    } catch (_) {
      return const Left(ChangeProfileStatusFailure.unknown());
    }
  }

  Future<Either<GetNotificationsFailure, List<Notification>>>
      getNotifications() async {
    try {
      final result = await _remoteDataSource.getNotifications();
      return Right(result);
    } catch (_) {
      return const Left(GetNotificationsFailure.unknown());
    }
  }
}
