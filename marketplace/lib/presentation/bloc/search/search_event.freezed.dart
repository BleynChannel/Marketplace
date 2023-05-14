// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SearchEvent {
  Filter get filter => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Filter filter) onLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Filter filter)? onLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Filter filter)? onLoaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SearchOnLoaded value) onLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchOnLoaded value)? onLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchOnLoaded value)? onLoaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchEventCopyWith<SearchEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchEventCopyWith<$Res> {
  factory $SearchEventCopyWith(
          SearchEvent value, $Res Function(SearchEvent) then) =
      _$SearchEventCopyWithImpl<$Res, SearchEvent>;
  @useResult
  $Res call({Filter filter});
}

/// @nodoc
class _$SearchEventCopyWithImpl<$Res, $Val extends SearchEvent>
    implements $SearchEventCopyWith<$Res> {
  _$SearchEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filter = null,
  }) {
    return _then(_value.copyWith(
      filter: null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as Filter,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchOnLoadedCopyWith<$Res>
    implements $SearchEventCopyWith<$Res> {
  factory _$$SearchOnLoadedCopyWith(
          _$SearchOnLoaded value, $Res Function(_$SearchOnLoaded) then) =
      __$$SearchOnLoadedCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Filter filter});
}

/// @nodoc
class __$$SearchOnLoadedCopyWithImpl<$Res>
    extends _$SearchEventCopyWithImpl<$Res, _$SearchOnLoaded>
    implements _$$SearchOnLoadedCopyWith<$Res> {
  __$$SearchOnLoadedCopyWithImpl(
      _$SearchOnLoaded _value, $Res Function(_$SearchOnLoaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filter = null,
  }) {
    return _then(_$SearchOnLoaded(
      null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as Filter,
    ));
  }
}

/// @nodoc

class _$SearchOnLoaded implements SearchOnLoaded {
  const _$SearchOnLoaded(this.filter);

  @override
  final Filter filter;

  @override
  String toString() {
    return 'SearchEvent.onLoaded(filter: $filter)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchOnLoaded &&
            (identical(other.filter, filter) || other.filter == filter));
  }

  @override
  int get hashCode => Object.hash(runtimeType, filter);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchOnLoadedCopyWith<_$SearchOnLoaded> get copyWith =>
      __$$SearchOnLoadedCopyWithImpl<_$SearchOnLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Filter filter) onLoaded,
  }) {
    return onLoaded(filter);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Filter filter)? onLoaded,
  }) {
    return onLoaded?.call(filter);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Filter filter)? onLoaded,
    required TResult orElse(),
  }) {
    if (onLoaded != null) {
      return onLoaded(filter);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SearchOnLoaded value) onLoaded,
  }) {
    return onLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchOnLoaded value)? onLoaded,
  }) {
    return onLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchOnLoaded value)? onLoaded,
    required TResult orElse(),
  }) {
    if (onLoaded != null) {
      return onLoaded(this);
    }
    return orElse();
  }
}

abstract class SearchOnLoaded implements SearchEvent {
  const factory SearchOnLoaded(final Filter filter) = _$SearchOnLoaded;

  @override
  Filter get filter;
  @override
  @JsonKey(ignore: true)
  _$$SearchOnLoadedCopyWith<_$SearchOnLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}
