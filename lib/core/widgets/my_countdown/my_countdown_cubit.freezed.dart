// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_countdown_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MyCountdownState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is MyCountdownState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'MyCountdownState()';
  }
}

/// @nodoc
class $MyCountdownStateCopyWith<$Res> {
  $MyCountdownStateCopyWith(
      MyCountdownState _, $Res Function(MyCountdownState) __);
}

/// @nodoc

class _Initial implements MyCountdownState {
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
    return 'MyCountdownState.initial()';
  }
}

/// @nodoc

class _Finished implements MyCountdownState {
  const _Finished();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Finished);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'MyCountdownState.finished()';
  }
}

/// @nodoc

class Counting implements MyCountdownState {
  const Counting(this.count);

  final int count;

  /// Create a copy of MyCountdownState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CountingCopyWith<Counting> get copyWith =>
      _$CountingCopyWithImpl<Counting>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Counting &&
            (identical(other.count, count) || other.count == count));
  }

  @override
  int get hashCode => Object.hash(runtimeType, count);

  @override
  String toString() {
    return 'MyCountdownState.counting(count: $count)';
  }
}

/// @nodoc
abstract mixin class $CountingCopyWith<$Res>
    implements $MyCountdownStateCopyWith<$Res> {
  factory $CountingCopyWith(Counting value, $Res Function(Counting) _then) =
      _$CountingCopyWithImpl;
  @useResult
  $Res call({int count});
}

/// @nodoc
class _$CountingCopyWithImpl<$Res> implements $CountingCopyWith<$Res> {
  _$CountingCopyWithImpl(this._self, this._then);

  final Counting _self;
  final $Res Function(Counting) _then;

  /// Create a copy of MyCountdownState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? count = null,
  }) {
    return _then(Counting(
      null == count
          ? _self.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
