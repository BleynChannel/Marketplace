import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:marketplace/domain/entity/login.dart';

part 'login_with_email_event.freezed.dart';

@freezed
class LoginWithEmailEvent with _$LoginWithEmailEvent {
  const factory LoginWithEmailEvent.onLogin(Login login) =
      LoginWithEmailOnLogin;
}
