// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'system_requirement.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SystemRequirement {
  SystemRequirementType get type => throw _privateConstructorUsedError;
  Platform get platform => throw _privateConstructorUsedError;
  List<String> get params => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SystemRequirementCopyWith<SystemRequirement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SystemRequirementCopyWith<$Res> {
  factory $SystemRequirementCopyWith(
          SystemRequirement value, $Res Function(SystemRequirement) then) =
      _$SystemRequirementCopyWithImpl<$Res, SystemRequirement>;
  @useResult
  $Res call(
      {SystemRequirementType type, Platform platform, List<String> params});
}

/// @nodoc
class _$SystemRequirementCopyWithImpl<$Res, $Val extends SystemRequirement>
    implements $SystemRequirementCopyWith<$Res> {
  _$SystemRequirementCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? platform = null,
    Object? params = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SystemRequirementType,
      platform: null == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as Platform,
      params: null == params
          ? _value.params
          : params // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SystemRequirementCopyWith<$Res>
    implements $SystemRequirementCopyWith<$Res> {
  factory _$$_SystemRequirementCopyWith(_$_SystemRequirement value,
          $Res Function(_$_SystemRequirement) then) =
      __$$_SystemRequirementCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {SystemRequirementType type, Platform platform, List<String> params});
}

/// @nodoc
class __$$_SystemRequirementCopyWithImpl<$Res>
    extends _$SystemRequirementCopyWithImpl<$Res, _$_SystemRequirement>
    implements _$$_SystemRequirementCopyWith<$Res> {
  __$$_SystemRequirementCopyWithImpl(
      _$_SystemRequirement _value, $Res Function(_$_SystemRequirement) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? platform = null,
    Object? params = null,
  }) {
    return _then(_$_SystemRequirement(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SystemRequirementType,
      platform: null == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as Platform,
      params: null == params
          ? _value._params
          : params // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$_SystemRequirement extends _SystemRequirement {
  const _$_SystemRequirement(
      {required this.type,
      required this.platform,
      required final List<String> params})
      : _params = params,
        super._();

  @override
  final SystemRequirementType type;
  @override
  final Platform platform;
  final List<String> _params;
  @override
  List<String> get params {
    if (_params is EqualUnmodifiableListView) return _params;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_params);
  }

  @override
  String toString() {
    return 'SystemRequirement(type: $type, platform: $platform, params: $params)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SystemRequirement &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.platform, platform) ||
                other.platform == platform) &&
            const DeepCollectionEquality().equals(other._params, _params));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type, platform,
      const DeepCollectionEquality().hash(_params));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SystemRequirementCopyWith<_$_SystemRequirement> get copyWith =>
      __$$_SystemRequirementCopyWithImpl<_$_SystemRequirement>(
          this, _$identity);
}

abstract class _SystemRequirement extends SystemRequirement {
  const factory _SystemRequirement(
      {required final SystemRequirementType type,
      required final Platform platform,
      required final List<String> params}) = _$_SystemRequirement;
  const _SystemRequirement._() : super._();

  @override
  SystemRequirementType get type;
  @override
  Platform get platform;
  @override
  List<String> get params;
  @override
  @JsonKey(ignore: true)
  _$$_SystemRequirementCopyWith<_$_SystemRequirement> get copyWith =>
      throw _privateConstructorUsedError;
}
