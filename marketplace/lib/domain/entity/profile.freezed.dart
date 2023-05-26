// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Profile {
  String get id => throw _privateConstructorUsedError;
  String get nickname => throw _privateConstructorUsedError;
  Media get avatar => throw _privateConstructorUsedError;
  Media get backgroundImage => throw _privateConstructorUsedError;
  Status? get status => throw _privateConstructorUsedError;
  int get purchases => throw _privateConstructorUsedError;
  int get desired => throw _privateConstructorUsedError;
  List<Contact> get contacts => throw _privateConstructorUsedError;
  List<Achievement> get achievements => throw _privateConstructorUsedError;
  List<CompactProduct> get favoriteGames => throw _privateConstructorUsedError;
  DateTime get registrationDate => throw _privateConstructorUsedError;
  DateTime get lastActivity => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProfileCopyWith<Profile> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileCopyWith<$Res> {
  factory $ProfileCopyWith(Profile value, $Res Function(Profile) then) =
      _$ProfileCopyWithImpl<$Res, Profile>;
  @useResult
  $Res call(
      {String id,
      String nickname,
      Media avatar,
      Media backgroundImage,
      Status? status,
      int purchases,
      int desired,
      List<Contact> contacts,
      List<Achievement> achievements,
      List<CompactProduct> favoriteGames,
      DateTime registrationDate,
      DateTime lastActivity});

  $MediaCopyWith<$Res> get avatar;
  $MediaCopyWith<$Res> get backgroundImage;
  $StatusCopyWith<$Res>? get status;
}

/// @nodoc
class _$ProfileCopyWithImpl<$Res, $Val extends Profile>
    implements $ProfileCopyWith<$Res> {
  _$ProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nickname = null,
    Object? avatar = null,
    Object? backgroundImage = null,
    Object? status = freezed,
    Object? purchases = null,
    Object? desired = null,
    Object? contacts = null,
    Object? achievements = null,
    Object? favoriteGames = null,
    Object? registrationDate = null,
    Object? lastActivity = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as Media,
      backgroundImage: null == backgroundImage
          ? _value.backgroundImage
          : backgroundImage // ignore: cast_nullable_to_non_nullable
              as Media,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status?,
      purchases: null == purchases
          ? _value.purchases
          : purchases // ignore: cast_nullable_to_non_nullable
              as int,
      desired: null == desired
          ? _value.desired
          : desired // ignore: cast_nullable_to_non_nullable
              as int,
      contacts: null == contacts
          ? _value.contacts
          : contacts // ignore: cast_nullable_to_non_nullable
              as List<Contact>,
      achievements: null == achievements
          ? _value.achievements
          : achievements // ignore: cast_nullable_to_non_nullable
              as List<Achievement>,
      favoriteGames: null == favoriteGames
          ? _value.favoriteGames
          : favoriteGames // ignore: cast_nullable_to_non_nullable
              as List<CompactProduct>,
      registrationDate: null == registrationDate
          ? _value.registrationDate
          : registrationDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastActivity: null == lastActivity
          ? _value.lastActivity
          : lastActivity // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MediaCopyWith<$Res> get avatar {
    return $MediaCopyWith<$Res>(_value.avatar, (value) {
      return _then(_value.copyWith(avatar: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MediaCopyWith<$Res> get backgroundImage {
    return $MediaCopyWith<$Res>(_value.backgroundImage, (value) {
      return _then(_value.copyWith(backgroundImage: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $StatusCopyWith<$Res>? get status {
    if (_value.status == null) {
      return null;
    }

    return $StatusCopyWith<$Res>(_value.status!, (value) {
      return _then(_value.copyWith(status: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ProfileCopyWith<$Res> implements $ProfileCopyWith<$Res> {
  factory _$$_ProfileCopyWith(
          _$_Profile value, $Res Function(_$_Profile) then) =
      __$$_ProfileCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String nickname,
      Media avatar,
      Media backgroundImage,
      Status? status,
      int purchases,
      int desired,
      List<Contact> contacts,
      List<Achievement> achievements,
      List<CompactProduct> favoriteGames,
      DateTime registrationDate,
      DateTime lastActivity});

  @override
  $MediaCopyWith<$Res> get avatar;
  @override
  $MediaCopyWith<$Res> get backgroundImage;
  @override
  $StatusCopyWith<$Res>? get status;
}

/// @nodoc
class __$$_ProfileCopyWithImpl<$Res>
    extends _$ProfileCopyWithImpl<$Res, _$_Profile>
    implements _$$_ProfileCopyWith<$Res> {
  __$$_ProfileCopyWithImpl(_$_Profile _value, $Res Function(_$_Profile) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nickname = null,
    Object? avatar = null,
    Object? backgroundImage = null,
    Object? status = freezed,
    Object? purchases = null,
    Object? desired = null,
    Object? contacts = null,
    Object? achievements = null,
    Object? favoriteGames = null,
    Object? registrationDate = null,
    Object? lastActivity = null,
  }) {
    return _then(_$_Profile(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as Media,
      backgroundImage: null == backgroundImage
          ? _value.backgroundImage
          : backgroundImage // ignore: cast_nullable_to_non_nullable
              as Media,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status?,
      purchases: null == purchases
          ? _value.purchases
          : purchases // ignore: cast_nullable_to_non_nullable
              as int,
      desired: null == desired
          ? _value.desired
          : desired // ignore: cast_nullable_to_non_nullable
              as int,
      contacts: null == contacts
          ? _value._contacts
          : contacts // ignore: cast_nullable_to_non_nullable
              as List<Contact>,
      achievements: null == achievements
          ? _value._achievements
          : achievements // ignore: cast_nullable_to_non_nullable
              as List<Achievement>,
      favoriteGames: null == favoriteGames
          ? _value._favoriteGames
          : favoriteGames // ignore: cast_nullable_to_non_nullable
              as List<CompactProduct>,
      registrationDate: null == registrationDate
          ? _value.registrationDate
          : registrationDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastActivity: null == lastActivity
          ? _value.lastActivity
          : lastActivity // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$_Profile implements _Profile {
  const _$_Profile(
      {required this.id,
      required this.nickname,
      required this.avatar,
      required this.backgroundImage,
      this.status,
      required this.purchases,
      required this.desired,
      required final List<Contact> contacts,
      required final List<Achievement> achievements,
      required final List<CompactProduct> favoriteGames,
      required this.registrationDate,
      required this.lastActivity})
      : _contacts = contacts,
        _achievements = achievements,
        _favoriteGames = favoriteGames;

  @override
  final String id;
  @override
  final String nickname;
  @override
  final Media avatar;
  @override
  final Media backgroundImage;
  @override
  final Status? status;
  @override
  final int purchases;
  @override
  final int desired;
  final List<Contact> _contacts;
  @override
  List<Contact> get contacts {
    if (_contacts is EqualUnmodifiableListView) return _contacts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_contacts);
  }

  final List<Achievement> _achievements;
  @override
  List<Achievement> get achievements {
    if (_achievements is EqualUnmodifiableListView) return _achievements;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_achievements);
  }

  final List<CompactProduct> _favoriteGames;
  @override
  List<CompactProduct> get favoriteGames {
    if (_favoriteGames is EqualUnmodifiableListView) return _favoriteGames;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favoriteGames);
  }

  @override
  final DateTime registrationDate;
  @override
  final DateTime lastActivity;

  @override
  String toString() {
    return 'Profile(id: $id, nickname: $nickname, avatar: $avatar, backgroundImage: $backgroundImage, status: $status, purchases: $purchases, desired: $desired, contacts: $contacts, achievements: $achievements, favoriteGames: $favoriteGames, registrationDate: $registrationDate, lastActivity: $lastActivity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Profile &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.backgroundImage, backgroundImage) ||
                other.backgroundImage == backgroundImage) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.purchases, purchases) ||
                other.purchases == purchases) &&
            (identical(other.desired, desired) || other.desired == desired) &&
            const DeepCollectionEquality().equals(other._contacts, _contacts) &&
            const DeepCollectionEquality()
                .equals(other._achievements, _achievements) &&
            const DeepCollectionEquality()
                .equals(other._favoriteGames, _favoriteGames) &&
            (identical(other.registrationDate, registrationDate) ||
                other.registrationDate == registrationDate) &&
            (identical(other.lastActivity, lastActivity) ||
                other.lastActivity == lastActivity));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      nickname,
      avatar,
      backgroundImage,
      status,
      purchases,
      desired,
      const DeepCollectionEquality().hash(_contacts),
      const DeepCollectionEquality().hash(_achievements),
      const DeepCollectionEquality().hash(_favoriteGames),
      registrationDate,
      lastActivity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProfileCopyWith<_$_Profile> get copyWith =>
      __$$_ProfileCopyWithImpl<_$_Profile>(this, _$identity);
}

abstract class _Profile implements Profile {
  const factory _Profile(
      {required final String id,
      required final String nickname,
      required final Media avatar,
      required final Media backgroundImage,
      final Status? status,
      required final int purchases,
      required final int desired,
      required final List<Contact> contacts,
      required final List<Achievement> achievements,
      required final List<CompactProduct> favoriteGames,
      required final DateTime registrationDate,
      required final DateTime lastActivity}) = _$_Profile;

  @override
  String get id;
  @override
  String get nickname;
  @override
  Media get avatar;
  @override
  Media get backgroundImage;
  @override
  Status? get status;
  @override
  int get purchases;
  @override
  int get desired;
  @override
  List<Contact> get contacts;
  @override
  List<Achievement> get achievements;
  @override
  List<CompactProduct> get favoriteGames;
  @override
  DateTime get registrationDate;
  @override
  DateTime get lastActivity;
  @override
  @JsonKey(ignore: true)
  _$$_ProfileCopyWith<_$_Profile> get copyWith =>
      throw _privateConstructorUsedError;
}
