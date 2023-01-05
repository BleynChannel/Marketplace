import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:marketplace/domain/entity/signup.dart';

part 'signup_event.freezed.dart';

@freezed
class SignUpEvent with _$SignUpEvent {
  const factory SignUpEvent.onSignUp(SignUp signUp) = SignUpOnSignUp;
}