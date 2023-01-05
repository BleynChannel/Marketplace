import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:marketplace/core/error/user/get_profile_failure.dart';
import 'package:marketplace/core/error/user/login_github_failure.dart';
import 'package:marketplace/core/error/user/login_google_failure.dart';
import 'package:marketplace/core/error/user/login_with_email_failure.dart';
import 'package:marketplace/core/error/user/signup_failure.dart';
import 'package:marketplace/data/datasource/user/user_remote_data_source.dart';
import 'package:marketplace/domain/entity/login.dart';
import 'package:marketplace/domain/entity/profile.dart';
import 'package:marketplace/domain/entity/signup.dart';

class UserRepository {
  final _remoteDataSource = UserRemoteDataSource();

  Future<Either<LoginGoogleFailure, void>> loginGoogle() async {
    try {
      await _remoteDataSource.loginGoogle();
      return const Right(null);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
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

  Future<Either<GetProfileFailure, Profile>> getProfile() async {
    try {
      final result = await _remoteDataSource.getProfile();
      return Right(result);
    } catch (_) {
      return const Left(GetProfileFailure.unknown());
    }
  }
}
