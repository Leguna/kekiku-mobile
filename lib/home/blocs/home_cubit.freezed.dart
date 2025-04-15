// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HomeState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is HomeState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'HomeState()';
  }
}

/// @nodoc
class $HomeStateCopyWith<$Res> {
  $HomeStateCopyWith(HomeState _, $Res Function(HomeState) __);
}

/// @nodoc

class _Initial implements HomeState {
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
    return 'HomeState.initial()';
  }
}

/// @nodoc

class _ImagePopup implements HomeState {
  const _ImagePopup({required this.isShowed});

  final bool isShowed;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ImagePopupCopyWith<_ImagePopup> get copyWith =>
      __$ImagePopupCopyWithImpl<_ImagePopup>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ImagePopup &&
            (identical(other.isShowed, isShowed) ||
                other.isShowed == isShowed));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isShowed);

  @override
  String toString() {
    return 'HomeState.imagePopup(isShowed: $isShowed)';
  }
}

/// @nodoc
abstract mixin class _$ImagePopupCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$ImagePopupCopyWith(
          _ImagePopup value, $Res Function(_ImagePopup) _then) =
      __$ImagePopupCopyWithImpl;

  @useResult
  $Res call({bool isShowed});
}

/// @nodoc
class __$ImagePopupCopyWithImpl<$Res> implements _$ImagePopupCopyWith<$Res> {
  __$ImagePopupCopyWithImpl(this._self, this._then);

  final _ImagePopup _self;
  final $Res Function(_ImagePopup) _then;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isShowed = null,
  }) {
    return _then(_ImagePopup(
      isShowed: null == isShowed
          ? _self.isShowed
          : isShowed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
