import 'package:freezed_annotation/freezed_annotation.dart';

part 'change_profile_background_image_failure.freezed.dart';

@freezed
class ChangeProfileBackgroundImageFailure
    with _$ChangeProfileBackgroundImageFailure {
  const factory ChangeProfileBackgroundImageFailure.unknown() =
      ChangeProfileBackgroundImageFailureUnknown;
}
