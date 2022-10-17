import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:marketplace/domain/entity/filter.dart';

part 'search_event.freezed.dart';

@freezed
class SearchEvent with _$SearchEvent {
  const factory SearchEvent.onLoaded(Filter filter) = SearchOnLoaded;
}
