import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:marketplace/core/error/auth/init_failure.dart';
import 'package:marketplace/core/error/auth/login_github_failure.dart';
import 'package:marketplace/core/error/auth/login_google_failure.dart';
import 'package:marketplace/core/error/auth/login_with_email_failure.dart';
import 'package:marketplace/core/error/auth/reset_password_failure.dart';
import 'package:marketplace/core/error/auth/sign_out_failure.dart';
import 'package:marketplace/core/error/auth/signup_failure.dart';
import 'package:marketplace/data/datasource/auth/auth_remote_data_source.dart';
import 'package:marketplace/domain/entity/login.dart';
import 'package:marketplace/domain/entity/signup.dart';

class AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  var rxUid = RxnString();
  String? get uid => rxUid.value;

  AuthRepository(this.remoteDataSource);

  Future<Either<InitFailure, void>> init() async {
    try {
      rxUid.value = remoteDataSource.getUserId();
      return const Right(null);
    } catch (_) {
      return const Left(InitFailure.unknown());
    }
  }

  Future<Either<LoginGoogleFailure, void>> loginGoogle() async {
    try {
      await remoteDataSource.loginGoogle();
      rxUid.value = remoteDataSource.getUserId();
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
      await remoteDataSource.loginGitHub();
      rxUid.value = remoteDataSource.getUserId();
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
      await remoteDataSource.loginWithEmail(login);
      rxUid.value = remoteDataSource.getUserId();
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
      await remoteDataSource.signUp(signUp);
      rxUid.value = remoteDataSource.getUserId();
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
      await remoteDataSource.resetPassword(email);
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
      await remoteDataSource.signOut();
      rxUid.value = remoteDataSource.getUserId();
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
}
