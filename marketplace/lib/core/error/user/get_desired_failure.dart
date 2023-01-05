import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_desired_failure.freezed.dart';

@freezed
class GetDesiredFailure with _$GetDesiredFailure {
  const factory GetDesiredFailure.unknown() = GetDesiredFailureUnknown;
}
