import 'package:freezed_annotation/freezed_annotation.dart';

part 'desired_event.freezed.dart';

@freezed
class DesiredEvent with _$DesiredEvent {
  const factory DesiredEvent.onLoaded() = DesiredOnLoaded;
}