import 'package:freezed_annotation/freezed_annotation.dart';

part 'change_profile_status_failure.freezed.dart';

@freezed
class ChangeProfileStatusFailure with _$ChangeProfileStatusFailure {
  const factory ChangeProfileStatusFailure.unknown() =
      ChangeProfileStatusFailureUnknown;
}
