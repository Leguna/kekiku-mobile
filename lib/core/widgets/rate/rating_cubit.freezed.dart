// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rating_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RatingState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is RatingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'RatingState()';
  }
}

/// @nodoc
class $RatingStateCopyWith<$Res> {
  $RatingStateCopyWith(RatingState _, $Res Function(RatingState) __);
}

/// @nodoc

class _Initial implements RatingState {
  const _Initial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'RatingState.initial()';
  }
}

/// @nodoc

class Rating implements RatingState {
  const Rating(this.rating, this.lastRating);

  final int rating;
  final int lastRating;

  /// Create a copy of RatingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RatingCopyWith<Rating> get copyWith =>
      _$RatingCopyWithImpl<Rating>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Rating &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.lastRating, lastRating) ||
                other.lastRating == lastRating));
  }

  @override
  int get hashCode => Object.hash(runtimeType, rating, lastRating);

  @override
  String toString() {
    return 'RatingState.rating(rating: $rating, lastRating: $lastRating)';
  }
}

/// @nodoc
abstract mixin class $RatingCopyWith<$Res>
    implements $RatingStateCopyWith<$Res> {
  factory $RatingCopyWith(Rating value, $Res Function(Rating) _then) =
      _$RatingCopyWithImpl;
  @useResult
  $Res call({int rating, int lastRating});
}

/// @nodoc
class _$RatingCopyWithImpl<$Res> implements $RatingCopyWith<$Res> {
  _$RatingCopyWithImpl(this._self, this._then);

  final Rating _self;
  final $Res Function(Rating) _then;

  /// Create a copy of RatingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? rating = null,
    Object? lastRating = null,
  }) {
    return _then(Rating(
      null == rating
          ? _self.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
      null == lastRating
          ? _self.lastRating
          : lastRating // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class Submitting implements RatingState {
  const Submitting();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Submitting);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'RatingState.submitting()';
  }
}

/// @nodoc

class Submitted implements RatingState {
  const Submitted();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Submitted);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'RatingState.submitted()';
  }
}

// dart format on
