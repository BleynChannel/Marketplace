import 'package:freezed_annotation/freezed_annotation.dart';

part 'change_profile_password_failure.freezed.dart';

@freezed
class ChangeProfilePasswordFailure with _$ChangeProfilePasswordFailure {
  const factory ChangeProfilePasswordFailure.unknown() =
      ChangeProfilePasswordFailureUnknown;
  const factory ChangeProfilePasswordFailure.weakPassword() =
      ChangeProfilePasswordFailureWeakPassword;
  const factory ChangeProfilePasswordFailure.requiresRecentLogin() =
      ChangeProfilePasswordFailureRequiresRecentLogin;
}
