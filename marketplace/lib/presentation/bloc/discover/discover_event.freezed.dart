// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'discover_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DiscoverEvent {
  List<Platform> get platforms => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Platform> platforms) onLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Platform> platforms)? onLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Platform> platforms)? onLoaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DiscoverOnLoaded value) onLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DiscoverOnLoaded value)? onLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DiscoverOnLoaded value)? onLoaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DiscoverEventCopyWith<DiscoverEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiscoverEventCopyWith<$Res> {
  factory $DiscoverEventCopyWith(
          DiscoverEvent value, $Res Function(DiscoverEvent) then) =
      _$DiscoverEventCopyWithImpl<$Res, DiscoverEvent>;
  @useResult
  $Res call({List<Platform> platforms});
}

/// @nodoc
class _$DiscoverEventCopyWithImpl<$Res, $Val extends DiscoverEvent>
    implements $DiscoverEventCopyWith<$Res> {
  _$DiscoverEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? platforms = null,
  }) {
    return _then(_value.copyWith(
      platforms: null == platforms
          ? _value.platforms
          : platforms // ignore: cast_nullable_to_non_nullable
              as List<Platform>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DiscoverOnLoadedCopyWith<$Res>
    implements $DiscoverEventCopyWith<$Res> {
  factory _$$DiscoverOnLoadedCopyWith(
          _$DiscoverOnLoaded value, $Res Function(_$DiscoverOnLoaded) then) =
      __$$DiscoverOnLoadedCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Platform> platforms});
}

/// @nodoc
class __$$DiscoverOnLoadedCopyWithImpl<$Res>
    extends _$DiscoverEventCopyWithImpl<$Res, _$DiscoverOnLoaded>
    implements _$$DiscoverOnLoadedCopyWith<$Res> {
  __$$DiscoverOnLoadedCopyWithImpl(
      _$DiscoverOnLoaded _value, $Res Function(_$DiscoverOnLoaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? platforms = null,
  }) {
    return _then(_$DiscoverOnLoaded(
      null == platforms
          ? _value._platforms
          : platforms // ignore: cast_nullable_to_non_nullable
              as List<Platform>,
    ));
  }
}

/// @nodoc

class _$DiscoverOnLoaded implements DiscoverOnLoaded {
  const _$DiscoverOnLoaded(final List<Platform> platforms)
      : _platforms = platforms;

  final List<Platform> _platforms;
  @override
  List<Platform> get platforms {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_platforms);
  }

  @override
  String toString() {
    return 'DiscoverEvent.onLoaded(platforms: $platforms)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DiscoverOnLoaded &&
            const DeepCollectionEquality()
                .equals(other._platforms, _platforms));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_platforms));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DiscoverOnLoadedCopyWith<_$DiscoverOnLoaded> get copyWith =>
      __$$DiscoverOnLoadedCopyWithImpl<_$DiscoverOnLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Platform> platforms) onLoaded,
  }) {
    return onLoaded(platforms);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Platform> platforms)? onLoaded,
  }) {
    return onLoaded?.call(platforms);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Platform> platforms)? onLoaded,
    required TResult orElse(),
  }) {
    if (onLoaded != null) {
      return onLoaded(platforms);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DiscoverOnLoaded value) onLoaded,
  }) {
    return onLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DiscoverOnLoaded value)? onLoaded,
  }) {
    return onLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DiscoverOnLoaded value)? onLoaded,
    required TResult orElse(),
  }) {
    if (onLoaded != null) {
      return onLoaded(this);
    }
    return orElse();
  }
}

abstract class DiscoverOnLoaded implements DiscoverEvent {
  const factory DiscoverOnLoaded(final List<Platform> platforms) =
      _$DiscoverOnLoaded;

  @override
  List<Platform> get platforms;
  @override
  @JsonKey(ignore: true)
  _$$DiscoverOnLoadedCopyWith<_$DiscoverOnLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}
