import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup.freezed.dart';

@freezed
class SignUp with _$SignUp {
  const factory SignUp({
    required String nickname,
    required String email,
    required String password,
  }) = _SignUp;
}