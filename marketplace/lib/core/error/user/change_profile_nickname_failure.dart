import 'package:freezed_annotation/freezed_annotation.dart';

part 'change_profile_nickname_failure.freezed.dart';

@freezed
class ChangeProfileNicknameFailure with _$ChangeProfileNicknameFailure {
  const factory ChangeProfileNicknameFailure.unknown() =
      ChangeProfileNicknameFailureUnknown;
}
