// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_countdown_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MyCountdownState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() finished,
    required TResult Function(int count) counting,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? finished,
    TResult? Function(int count)? counting,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? finished,
    TResult Function(int count)? counting,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Finished value) finished,
    required TResult Function(_Counting value) counting,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Finished value)? finished,
    TResult? Function(_Counting value)? counting,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Finished value)? finished,
    TResult Function(_Counting value)? counting,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyCountdownStateCopyWith<$Res> {
  factory $MyCountdownStateCopyWith(
          MyCountdownState value, $Res Function(MyCountdownState) then) =
      _$MyCountdownStateCopyWithImpl<$Res, MyCountdownState>;
}

/// @nodoc
class _$MyCountdownStateCopyWithImpl<$Res, $Val extends MyCountdownState>
    implements $MyCountdownStateCopyWith<$Res> {
  _$MyCountdownStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MyCountdownState
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
    extends _$MyCountdownStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of MyCountdownState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'MyCountdownState.initial()';
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
    required TResult Function() finished,
    required TResult Function(int count) counting,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? finished,
    TResult? Function(int count)? counting,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? finished,
    TResult Function(int count)? counting,
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
    required TResult Function(_Finished value) finished,
    required TResult Function(_Counting value) counting,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Finished value)? finished,
    TResult? Function(_Counting value)? counting,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Finished value)? finished,
    TResult Function(_Counting value)? counting,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements MyCountdownState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$FinishedImplCopyWith<$Res> {
  factory _$$FinishedImplCopyWith(
          _$FinishedImpl value, $Res Function(_$FinishedImpl) then) =
      __$$FinishedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FinishedImplCopyWithImpl<$Res>
    extends _$MyCountdownStateCopyWithImpl<$Res, _$FinishedImpl>
    implements _$$FinishedImplCopyWith<$Res> {
  __$$FinishedImplCopyWithImpl(
      _$FinishedImpl _value, $Res Function(_$FinishedImpl) _then)
      : super(_value, _then);

  /// Create a copy of MyCountdownState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FinishedImpl implements _Finished {
  const _$FinishedImpl();

  @override
  String toString() {
    return 'MyCountdownState.finished()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FinishedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() finished,
    required TResult Function(int count) counting,
  }) {
    return finished();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? finished,
    TResult? Function(int count)? counting,
  }) {
    return finished?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? finished,
    TResult Function(int count)? counting,
    required TResult orElse(),
  }) {
    if (finished != null) {
      return finished();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Finished value) finished,
    required TResult Function(_Counting value) counting,
  }) {
    return finished(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Finished value)? finished,
    TResult? Function(_Counting value)? counting,
  }) {
    return finished?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Finished value)? finished,
    TResult Function(_Counting value)? counting,
    required TResult orElse(),
  }) {
    if (finished != null) {
      return finished(this);
    }
    return orElse();
  }
}

abstract class _Finished implements MyCountdownState {
  const factory _Finished() = _$FinishedImpl;
}

/// @nodoc
abstract class _$$CountingImplCopyWith<$Res> {
  factory _$$CountingImplCopyWith(
          _$CountingImpl value, $Res Function(_$CountingImpl) then) =
      __$$CountingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int count});
}

/// @nodoc
class __$$CountingImplCopyWithImpl<$Res>
    extends _$MyCountdownStateCopyWithImpl<$Res, _$CountingImpl>
    implements _$$CountingImplCopyWith<$Res> {
  __$$CountingImplCopyWithImpl(
      _$CountingImpl _value, $Res Function(_$CountingImpl) _then)
      : super(_value, _then);

  /// Create a copy of MyCountdownState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
  }) {
    return _then(_$CountingImpl(
      null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$CountingImpl implements _Counting {
  const _$CountingImpl(this.count);

  @override
  final int count;

  @override
  String toString() {
    return 'MyCountdownState.counting(count: $count)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CountingImpl &&
            (identical(other.count, count) || other.count == count));
  }

  @override
  int get hashCode => Object.hash(runtimeType, count);

  /// Create a copy of MyCountdownState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CountingImplCopyWith<_$CountingImpl> get copyWith =>
      __$$CountingImplCopyWithImpl<_$CountingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() finished,
    required TResult Function(int count) counting,
  }) {
    return counting(count);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? finished,
    TResult? Function(int count)? counting,
  }) {
    return counting?.call(count);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? finished,
    TResult Function(int count)? counting,
    required TResult orElse(),
  }) {
    if (counting != null) {
      return counting(count);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Finished value) finished,
    required TResult Function(_Counting value) counting,
  }) {
    return counting(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Finished value)? finished,
    TResult? Function(_Counting value)? counting,
  }) {
    return counting?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Finished value)? finished,
    TResult Function(_Counting value)? counting,
    required TResult orElse(),
  }) {
    if (counting != null) {
      return counting(this);
    }
    return orElse();
  }
}

abstract class _Counting implements MyCountdownState {
  const factory _Counting(final int count) = _$CountingImpl;

  int get count;

  /// Create a copy of MyCountdownState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CountingImplCopyWith<_$CountingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
