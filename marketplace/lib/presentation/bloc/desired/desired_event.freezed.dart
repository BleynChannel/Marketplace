// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'desired_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DesiredEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() onLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? onLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onLoaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DesiredOnLoaded value) onLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DesiredOnLoaded value)? onLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DesiredOnLoaded value)? onLoaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DesiredEventCopyWith<$Res> {
  factory $DesiredEventCopyWith(
          DesiredEvent value, $Res Function(DesiredEvent) then) =
      _$DesiredEventCopyWithImpl<$Res, DesiredEvent>;
}

/// @nodoc
class _$DesiredEventCopyWithImpl<$Res, $Val extends DesiredEvent>
    implements $DesiredEventCopyWith<$Res> {
  _$DesiredEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$DesiredOnLoadedCopyWith<$Res> {
  factory _$$DesiredOnLoadedCopyWith(
          _$DesiredOnLoaded value, $Res Function(_$DesiredOnLoaded) then) =
      __$$DesiredOnLoadedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DesiredOnLoadedCopyWithImpl<$Res>
    extends _$DesiredEventCopyWithImpl<$Res, _$DesiredOnLoaded>
    implements _$$DesiredOnLoadedCopyWith<$Res> {
  __$$DesiredOnLoadedCopyWithImpl(
      _$DesiredOnLoaded _value, $Res Function(_$DesiredOnLoaded) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DesiredOnLoaded implements DesiredOnLoaded {
  const _$DesiredOnLoaded();

  @override
  String toString() {
    return 'DesiredEvent.onLoaded()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DesiredOnLoaded);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() onLoaded,
  }) {
    return onLoaded();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? onLoaded,
  }) {
    return onLoaded?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onLoaded,
    required TResult orElse(),
  }) {
    if (onLoaded != null) {
      return onLoaded();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DesiredOnLoaded value) onLoaded,
  }) {
    return onLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DesiredOnLoaded value)? onLoaded,
  }) {
    return onLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DesiredOnLoaded value)? onLoaded,
    required TResult orElse(),
  }) {
    if (onLoaded != null) {
      return onLoaded(this);
    }
    return orElse();
  }
}

abstract class DesiredOnLoaded implements DesiredEvent {
  const factory DesiredOnLoaded() = _$DesiredOnLoaded;
}
