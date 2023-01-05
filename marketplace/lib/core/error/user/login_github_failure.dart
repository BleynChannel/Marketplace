import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_github_failure.freezed.dart';

@freezed
class LoginGitHubFailure with _$LoginGitHubFailure {
  const factory LoginGitHubFailure.unknown() = LoginGitHubFailureUnknown;
  const factory LoginGitHubFailure.userDisabled() =
      LoginGitHubFailureUserDisabled;
}
