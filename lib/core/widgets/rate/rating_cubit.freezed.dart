// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rating_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RatingState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int rating, int lastRating) rating,
    required TResult Function() submitting,
    required TResult Function() submitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int rating, int lastRating)? rating,
    TResult? Function()? submitting,
    TResult? Function()? submitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int rating, int lastRating)? rating,
    TResult Function()? submitting,
    TResult Function()? submitted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Rating value) rating,
    required TResult Function(_Submitting value) submitting,
    required TResult Function(_Submitted value) submitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Rating value)? rating,
    TResult? Function(_Submitting value)? submitting,
    TResult? Function(_Submitted value)? submitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Rating value)? rating,
    TResult Function(_Submitting value)? submitting,
    TResult Function(_Submitted value)? submitted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RatingStateCopyWith<$Res> {
  factory $RatingStateCopyWith(
          RatingState value, $Res Function(RatingState) then) =
      _$RatingStateCopyWithImpl<$Res, RatingState>;
}

/// @nodoc
class _$RatingStateCopyWithImpl<$Res, $Val extends RatingState>
    implements $RatingStateCopyWith<$Res> {
  _$RatingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RatingState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$RatingStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of RatingState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'RatingState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int rating, int lastRating) rating,
    required TResult Function() submitting,
    required TResult Function() submitted,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int rating, int lastRating)? rating,
    TResult? Function()? submitting,
    TResult? Function()? submitted,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int rating, int lastRating)? rating,
    TResult Function()? submitting,
    TResult Function()? submitted,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Rating value) rating,
    required TResult Function(_Submitting value) submitting,
    required TResult Function(_Submitted value) submitted,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Rating value)? rating,
    TResult? Function(_Submitting value)? submitting,
    TResult? Function(_Submitted value)? submitted,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Rating value)? rating,
    TResult Function(_Submitting value)? submitting,
    TResult Function(_Submitted value)? submitted,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements RatingState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$RatingImplCopyWith<$Res> {
  factory _$$RatingImplCopyWith(
          _$RatingImpl value, $Res Function(_$RatingImpl) then) =
      __$$RatingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int rating, int lastRating});
}

/// @nodoc
class __$$RatingImplCopyWithImpl<$Res>
    extends _$RatingStateCopyWithImpl<$Res, _$RatingImpl>
    implements _$$RatingImplCopyWith<$Res> {
  __$$RatingImplCopyWithImpl(
      _$RatingImpl _value, $Res Function(_$RatingImpl) _then)
      : super(_value, _then);

  /// Create a copy of RatingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rating = null,
    Object? lastRating = null,
  }) {
    return _then(_$RatingImpl(
      null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
      null == lastRating
          ? _value.lastRating
          : lastRating // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$RatingImpl implements _Rating {
  const _$RatingImpl(this.rating, this.lastRating);

  @override
  final int rating;
  @override
  final int lastRating;

  @override
  String toString() {
    return 'RatingState.rating(rating: $rating, lastRating: $lastRating)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RatingImpl &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.lastRating, lastRating) ||
                other.lastRating == lastRating));
  }

  @override
  int get hashCode => Object.hash(runtimeType, rating, lastRating);

  /// Create a copy of RatingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RatingImplCopyWith<_$RatingImpl> get copyWith =>
      __$$RatingImplCopyWithImpl<_$RatingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int rating, int lastRating) rating,
    required TResult Function() submitting,
    required TResult Function() submitted,
  }) {
    return rating(this.rating, lastRating);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int rating, int lastRating)? rating,
    TResult? Function()? submitting,
    TResult? Function()? submitted,
  }) {
    return rating?.call(this.rating, lastRating);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int rating, int lastRating)? rating,
    TResult Function()? submitting,
    TResult Function()? submitted,
    required TResult orElse(),
  }) {
    if (rating != null) {
      return rating(this.rating, lastRating);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Rating value) rating,
    required TResult Function(_Submitting value) submitting,
    required TResult Function(_Submitted value) submitted,
  }) {
    return rating(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Rating value)? rating,
    TResult? Function(_Submitting value)? submitting,
    TResult? Function(_Submitted value)? submitted,
  }) {
    return rating?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Rating value)? rating,
    TResult Function(_Submitting value)? submitting,
    TResult Function(_Submitted value)? submitted,
    required TResult orElse(),
  }) {
    if (rating != null) {
      return rating(this);
    }
    return orElse();
  }
}

abstract class _Rating implements RatingState {
  const factory _Rating(final int rating, final int lastRating) = _$RatingImpl;

  int get rating;
  int get lastRating;

  /// Create a copy of RatingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RatingImplCopyWith<_$RatingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SubmittingImplCopyWith<$Res> {
  factory _$$SubmittingImplCopyWith(
          _$SubmittingImpl value, $Res Function(_$SubmittingImpl) then) =
      __$$SubmittingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SubmittingImplCopyWithImpl<$Res>
    extends _$RatingStateCopyWithImpl<$Res, _$SubmittingImpl>
    implements _$$SubmittingImplCopyWith<$Res> {
  __$$SubmittingImplCopyWithImpl(
      _$SubmittingImpl _value, $Res Function(_$SubmittingImpl) _then)
      : super(_value, _then);

  /// Create a copy of RatingState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SubmittingImpl implements _Submitting {
  const _$SubmittingImpl();

  @override
  String toString() {
    return 'RatingState.submitting()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SubmittingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int rating, int lastRating) rating,
    required TResult Function() submitting,
    required TResult Function() submitted,
  }) {
    return submitting();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int rating, int lastRating)? rating,
    TResult? Function()? submitting,
    TResult? Function()? submitted,
  }) {
    return submitting?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int rating, int lastRating)? rating,
    TResult Function()? submitting,
    TResult Function()? submitted,
    required TResult orElse(),
  }) {
    if (submitting != null) {
      return submitting();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Rating value) rating,
    required TResult Function(_Submitting value) submitting,
    required TResult Function(_Submitted value) submitted,
  }) {
    return submitting(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Rating value)? rating,
    TResult? Function(_Submitting value)? submitting,
    TResult? Function(_Submitted value)? submitted,
  }) {
    return submitting?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Rating value)? rating,
    TResult Function(_Submitting value)? submitting,
    TResult Function(_Submitted value)? submitted,
    required TResult orElse(),
  }) {
    if (submitting != null) {
      return submitting(this);
    }
    return orElse();
  }
}

abstract class _Submitting implements RatingState {
  const factory _Submitting() = _$SubmittingImpl;
}

/// @nodoc
abstract class _$$SubmittedImplCopyWith<$Res> {
  factory _$$SubmittedImplCopyWith(
          _$SubmittedImpl value, $Res Function(_$SubmittedImpl) then) =
      __$$SubmittedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SubmittedImplCopyWithImpl<$Res>
    extends _$RatingStateCopyWithImpl<$Res, _$SubmittedImpl>
    implements _$$SubmittedImplCopyWith<$Res> {
  __$$SubmittedImplCopyWithImpl(
      _$SubmittedImpl _value, $Res Function(_$SubmittedImpl) _then)
      : super(_value, _then);

  /// Create a copy of RatingState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SubmittedImpl implements _Submitted {
  const _$SubmittedImpl();

  @override
  String toString() {
    return 'RatingState.submitted()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SubmittedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int rating, int lastRating) rating,
    required TResult Function() submitting,
    required TResult Function() submitted,
  }) {
    return submitted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int rating, int lastRating)? rating,
    TResult? Function()? submitting,
    TResult? Function()? submitted,
  }) {
    return submitted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int rating, int lastRating)? rating,
    TResult Function()? submitting,
    TResult Function()? submitted,
    required TResult orElse(),
  }) {
    if (submitted != null) {
      return submitted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Rating value) rating,
    required TResult Function(_Submitting value) submitting,
    required TResult Function(_Submitted value) submitted,
  }) {
    return submitted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Rating value)? rating,
    TResult? Function(_Submitting value)? submitting,
    TResult? Function(_Submitted value)? submitted,
  }) {
    return submitted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Rating value)? rating,
    TResult Function(_Submitting value)? submitting,
    TResult Function(_Submitted value)? submitted,
    required TResult orElse(),
  }) {
    if (submitted != null) {
      return submitted(this);
    }
    return orElse();
  }
}

abstract class _Submitted implements RatingState {
  const factory _Submitted() = _$SubmittedImpl;
}
