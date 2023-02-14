import 'package:freezed_annotation/freezed_annotation.dart';

part 'init_failure.freezed.dart';

@freezed
class InitFailure with _$InitFailure {
  const factory InitFailure.unknown() = InitFailureUnknown;
}
