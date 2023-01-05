// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'product_review.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProductReview {
  User get user => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductReviewCopyWith<ProductReview> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductReviewCopyWith<$Res> {
  factory $ProductReviewCopyWith(
          ProductReview value, $Res Function(ProductReview) then) =
      _$ProductReviewCopyWithImpl<$Res, ProductReview>;
  @useResult
  $Res call({User user, double rating, String description});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$ProductReviewCopyWithImpl<$Res, $Val extends ProductReview>
    implements $ProductReviewCopyWith<$Res> {
  _$ProductReviewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? rating = null,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ProductReviewCopyWith<$Res>
    implements $ProductReviewCopyWith<$Res> {
  factory _$$_ProductReviewCopyWith(
          _$_ProductReview value, $Res Function(_$_ProductReview) then) =
      __$$_ProductReviewCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({User user, double rating, String description});

  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$_ProductReviewCopyWithImpl<$Res>
    extends _$ProductReviewCopyWithImpl<$Res, _$_ProductReview>
    implements _$$_ProductReviewCopyWith<$Res> {
  __$$_ProductReviewCopyWithImpl(
      _$_ProductReview _value, $Res Function(_$_ProductReview) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? rating = null,
    Object? description = null,
  }) {
    return _then(_$_ProductReview(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ProductReview implements _ProductReview {
  const _$_ProductReview(
      {required this.user, required this.rating, required this.description});

  @override
  final User user;
  @override
  final double rating;
  @override
  final String description;

  @override
  String toString() {
    return 'ProductReview(user: $user, rating: $rating, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductReview &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user, rating, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductReviewCopyWith<_$_ProductReview> get copyWith =>
      __$$_ProductReviewCopyWithImpl<_$_ProductReview>(this, _$identity);
}

abstract class _ProductReview implements ProductReview {
  const factory _ProductReview(
      {required final User user,
      required final double rating,
      required final String description}) = _$_ProductReview;

  @override
  User get user;
  @override
  double get rating;
  @override
  String get description;
  @override
  @JsonKey(ignore: true)
  _$$_ProductReviewCopyWith<_$_ProductReview> get copyWith =>
      throw _privateConstructorUsedError;
}
