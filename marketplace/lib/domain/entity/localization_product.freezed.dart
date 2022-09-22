// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'localization_product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LocalizationProduct {
  String get language => throw _privateConstructorUsedError;
  bool get enabledSound => throw _privateConstructorUsedError;
  bool get enabledInterface => throw _privateConstructorUsedError;
  bool get enabledSubtitles => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LocalizationProductCopyWith<LocalizationProduct> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalizationProductCopyWith<$Res> {
  factory $LocalizationProductCopyWith(
          LocalizationProduct value, $Res Function(LocalizationProduct) then) =
      _$LocalizationProductCopyWithImpl<$Res>;
  $Res call(
      {String language,
      bool enabledSound,
      bool enabledInterface,
      bool enabledSubtitles});
}

/// @nodoc
class _$LocalizationProductCopyWithImpl<$Res>
    implements $LocalizationProductCopyWith<$Res> {
  _$LocalizationProductCopyWithImpl(this._value, this._then);

  final LocalizationProduct _value;
  // ignore: unused_field
  final $Res Function(LocalizationProduct) _then;

  @override
  $Res call({
    Object? language = freezed,
    Object? enabledSound = freezed,
    Object? enabledInterface = freezed,
    Object? enabledSubtitles = freezed,
  }) {
    return _then(_value.copyWith(
      language: language == freezed
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      enabledSound: enabledSound == freezed
          ? _value.enabledSound
          : enabledSound // ignore: cast_nullable_to_non_nullable
              as bool,
      enabledInterface: enabledInterface == freezed
          ? _value.enabledInterface
          : enabledInterface // ignore: cast_nullable_to_non_nullable
              as bool,
      enabledSubtitles: enabledSubtitles == freezed
          ? _value.enabledSubtitles
          : enabledSubtitles // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_LocalizationProductCopyWith<$Res>
    implements $LocalizationProductCopyWith<$Res> {
  factory _$$_LocalizationProductCopyWith(_$_LocalizationProduct value,
          $Res Function(_$_LocalizationProduct) then) =
      __$$_LocalizationProductCopyWithImpl<$Res>;
  @override
  $Res call(
      {String language,
      bool enabledSound,
      bool enabledInterface,
      bool enabledSubtitles});
}

/// @nodoc
class __$$_LocalizationProductCopyWithImpl<$Res>
    extends _$LocalizationProductCopyWithImpl<$Res>
    implements _$$_LocalizationProductCopyWith<$Res> {
  __$$_LocalizationProductCopyWithImpl(_$_LocalizationProduct _value,
      $Res Function(_$_LocalizationProduct) _then)
      : super(_value, (v) => _then(v as _$_LocalizationProduct));

  @override
  _$_LocalizationProduct get _value => super._value as _$_LocalizationProduct;

  @override
  $Res call({
    Object? language = freezed,
    Object? enabledSound = freezed,
    Object? enabledInterface = freezed,
    Object? enabledSubtitles = freezed,
  }) {
    return _then(_$_LocalizationProduct(
      language: language == freezed
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      enabledSound: enabledSound == freezed
          ? _value.enabledSound
          : enabledSound // ignore: cast_nullable_to_non_nullable
              as bool,
      enabledInterface: enabledInterface == freezed
          ? _value.enabledInterface
          : enabledInterface // ignore: cast_nullable_to_non_nullable
              as bool,
      enabledSubtitles: enabledSubtitles == freezed
          ? _value.enabledSubtitles
          : enabledSubtitles // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_LocalizationProduct implements _LocalizationProduct {
  const _$_LocalizationProduct(
      {required this.language,
      required this.enabledSound,
      required this.enabledInterface,
      required this.enabledSubtitles});

  @override
  final String language;
  @override
  final bool enabledSound;
  @override
  final bool enabledInterface;
  @override
  final bool enabledSubtitles;

  @override
  String toString() {
    return 'LocalizationProduct(language: $language, enabledSound: $enabledSound, enabledInterface: $enabledInterface, enabledSubtitles: $enabledSubtitles)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LocalizationProduct &&
            const DeepCollectionEquality().equals(other.language, language) &&
            const DeepCollectionEquality()
                .equals(other.enabledSound, enabledSound) &&
            const DeepCollectionEquality()
                .equals(other.enabledInterface, enabledInterface) &&
            const DeepCollectionEquality()
                .equals(other.enabledSubtitles, enabledSubtitles));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(language),
      const DeepCollectionEquality().hash(enabledSound),
      const DeepCollectionEquality().hash(enabledInterface),
      const DeepCollectionEquality().hash(enabledSubtitles));

  @JsonKey(ignore: true)
  @override
  _$$_LocalizationProductCopyWith<_$_LocalizationProduct> get copyWith =>
      __$$_LocalizationProductCopyWithImpl<_$_LocalizationProduct>(
          this, _$identity);
}

abstract class _LocalizationProduct implements LocalizationProduct {
  const factory _LocalizationProduct(
      {required final String language,
      required final bool enabledSound,
      required final bool enabledInterface,
      required final bool enabledSubtitles}) = _$_LocalizationProduct;

  @override
  String get language;
  @override
  bool get enabledSound;
  @override
  bool get enabledInterface;
  @override
  bool get enabledSubtitles;
  @override
  @JsonKey(ignore: true)
  _$$_LocalizationProductCopyWith<_$_LocalizationProduct> get copyWith =>
      throw _privateConstructorUsedError;
}
