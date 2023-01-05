// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'media.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MediaData {
  dynamic get data => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MediaDataCopyWith<MediaData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MediaDataCopyWith<$Res> {
  factory $MediaDataCopyWith(MediaData value, $Res Function(MediaData) then) =
      _$MediaDataCopyWithImpl<$Res, MediaData>;
  @useResult
  $Res call({dynamic data});
}

/// @nodoc
class _$MediaDataCopyWithImpl<$Res, $Val extends MediaData>
    implements $MediaDataCopyWith<$Res> {
  _$MediaDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MediaDataCopyWith<$Res> implements $MediaDataCopyWith<$Res> {
  factory _$$_MediaDataCopyWith(
          _$_MediaData value, $Res Function(_$_MediaData) then) =
      __$$_MediaDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({dynamic data});
}

/// @nodoc
class __$$_MediaDataCopyWithImpl<$Res>
    extends _$MediaDataCopyWithImpl<$Res, _$_MediaData>
    implements _$$_MediaDataCopyWith<$Res> {
  __$$_MediaDataCopyWithImpl(
      _$_MediaData _value, $Res Function(_$_MediaData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$_MediaData(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$_MediaData extends _MediaData with DiagnosticableTreeMixin {
  const _$_MediaData({required this.data}) : super._();

  @override
  final dynamic data;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MediaData(data: $data)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MediaData'))
      ..add(DiagnosticsProperty('data', data));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MediaData &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MediaDataCopyWith<_$_MediaData> get copyWith =>
      __$$_MediaDataCopyWithImpl<_$_MediaData>(this, _$identity);
}

abstract class _MediaData extends MediaData {
  const factory _MediaData({required final dynamic data}) = _$_MediaData;
  const _MediaData._() : super._();

  @override
  dynamic get data;
  @override
  @JsonKey(ignore: true)
  _$$_MediaDataCopyWith<_$_MediaData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Media {
  MediaType get type => throw _privateConstructorUsedError;
  MediaLocation get location => throw _privateConstructorUsedError;
  MediaData get data => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MediaCopyWith<Media> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MediaCopyWith<$Res> {
  factory $MediaCopyWith(Media value, $Res Function(Media) then) =
      _$MediaCopyWithImpl<$Res, Media>;
  @useResult
  $Res call({MediaType type, MediaLocation location, MediaData data});

  $MediaDataCopyWith<$Res> get data;
}

/// @nodoc
class _$MediaCopyWithImpl<$Res, $Val extends Media>
    implements $MediaCopyWith<$Res> {
  _$MediaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? location = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MediaType,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as MediaLocation,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as MediaData,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MediaDataCopyWith<$Res> get data {
    return $MediaDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_MediaCopyWith<$Res> implements $MediaCopyWith<$Res> {
  factory _$$_MediaCopyWith(_$_Media value, $Res Function(_$_Media) then) =
      __$$_MediaCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({MediaType type, MediaLocation location, MediaData data});

  @override
  $MediaDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$_MediaCopyWithImpl<$Res> extends _$MediaCopyWithImpl<$Res, _$_Media>
    implements _$$_MediaCopyWith<$Res> {
  __$$_MediaCopyWithImpl(_$_Media _value, $Res Function(_$_Media) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? location = null,
    Object? data = null,
  }) {
    return _then(_$_Media(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MediaType,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as MediaLocation,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as MediaData,
    ));
  }
}

/// @nodoc

class _$_Media with DiagnosticableTreeMixin implements _Media {
  const _$_Media(
      {required this.type, required this.location, required this.data});

  @override
  final MediaType type;
  @override
  final MediaLocation location;
  @override
  final MediaData data;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Media(type: $type, location: $location, data: $data)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Media'))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('location', location))
      ..add(DiagnosticsProperty('data', data));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Media &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type, location, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MediaCopyWith<_$_Media> get copyWith =>
      __$$_MediaCopyWithImpl<_$_Media>(this, _$identity);
}

abstract class _Media implements Media {
  const factory _Media(
      {required final MediaType type,
      required final MediaLocation location,
      required final MediaData data}) = _$_Media;

  @override
  MediaType get type;
  @override
  MediaLocation get location;
  @override
  MediaData get data;
  @override
  @JsonKey(ignore: true)
  _$$_MediaCopyWith<_$_Media> get copyWith =>
      throw _privateConstructorUsedError;
}
