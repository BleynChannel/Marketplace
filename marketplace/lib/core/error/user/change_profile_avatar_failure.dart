import 'package:freezed_annotation/freezed_annotation.dart';

part 'change_profile_avatar_failure.freezed.dart';

@freezed
class ChangeProfileAvatarFailure with _$ChangeProfileAvatarFailure {
  const factory ChangeProfileAvatarFailure.unknown() =
      ChangeProfileAvatarFailureUnknown;
}
