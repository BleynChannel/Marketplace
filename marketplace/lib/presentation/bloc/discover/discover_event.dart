import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:marketplace/domain/entity/platform.dart';

part 'discover_event.freezed.dart';

@freezed
class DiscoverEvent with _$DiscoverEvent {
  const factory DiscoverEvent.onLoaded(List<Platform> platforms) =
      DiscoverOnLoaded;
}
