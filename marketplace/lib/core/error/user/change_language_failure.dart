import 'package:freezed_annotation/freezed_annotation.dart';

part 'change_language_failure.freezed.dart';

@freezed
class ChangeLanguageFailure with _$ChangeLanguageFailure {
  const factory ChangeLanguageFailure.unknown() = ChangeLanguageFailureUnknown;
}
