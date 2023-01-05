import 'package:freezed_annotation/freezed_annotation.dart';

part 'login.freezed.dart';

@freezed
class Login with _$Login {
  const factory Login({
    required String email,
    required String password,
  }) = _Login;
}
