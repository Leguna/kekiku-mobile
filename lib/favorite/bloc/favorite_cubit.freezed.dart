// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorite_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FavoriteState<T> {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is FavoriteState<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FavoriteState<$T>()';
  }
}

/// @nodoc
class $FavoriteStateCopyWith<T, $Res> {
  $FavoriteStateCopyWith(
      FavoriteState<T> _, $Res Function(FavoriteState<T>) __);
}

/// @nodoc

class _Initial<T> implements FavoriteState<T> {
  const _Initial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Initial<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FavoriteState<$T>.initial()';
  }
}

/// @nodoc

class _Loading<T> implements FavoriteState<T> {
  const _Loading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Loading<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'FavoriteState<$T>.loading()';
  }
}

/// @nodoc

class FavoriteLoaded<T> implements FavoriteState<T> {
  const FavoriteLoaded(final List<T> products) : _products = products;

  final List<T> _products;
  List<T> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  /// Create a copy of FavoriteState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FavoriteLoadedCopyWith<T, FavoriteLoaded<T>> get copyWith =>
      _$FavoriteLoadedCopyWithImpl<T, FavoriteLoaded<T>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FavoriteLoaded<T> &&
            const DeepCollectionEquality().equals(other._products, _products));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_products));

  @override
  String toString() {
    return 'FavoriteState<$T>.loaded(products: $products)';
  }
}

/// @nodoc
abstract mixin class $FavoriteLoadedCopyWith<T, $Res>
    implements $FavoriteStateCopyWith<T, $Res> {
  factory $FavoriteLoadedCopyWith(
          FavoriteLoaded<T> value, $Res Function(FavoriteLoaded<T>) _then) =
      _$FavoriteLoadedCopyWithImpl;
  @useResult
  $Res call({List<T> products});
}

/// @nodoc
class _$FavoriteLoadedCopyWithImpl<T, $Res>
    implements $FavoriteLoadedCopyWith<T, $Res> {
  _$FavoriteLoadedCopyWithImpl(this._self, this._then);

  final FavoriteLoaded<T> _self;
  final $Res Function(FavoriteLoaded<T>) _then;

  /// Create a copy of FavoriteState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? products = null,
  }) {
    return _then(FavoriteLoaded<T>(
      null == products
          ? _self._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<T>,
    ));
  }
}

/// @nodoc

class FavoriteChanged<T> implements FavoriteState<T> {
  const FavoriteChanged(this.id, this.isFavorite);

  final String id;
  final bool isFavorite;

  /// Create a copy of FavoriteState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FavoriteChangedCopyWith<T, FavoriteChanged<T>> get copyWith =>
      _$FavoriteChangedCopyWithImpl<T, FavoriteChanged<T>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FavoriteChanged<T> &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, isFavorite);

  @override
  String toString() {
    return 'FavoriteState<$T>.favoriteChanged(id: $id, isFavorite: $isFavorite)';
  }
}

/// @nodoc
abstract mixin class $FavoriteChangedCopyWith<T, $Res>
    implements $FavoriteStateCopyWith<T, $Res> {
  factory $FavoriteChangedCopyWith(
          FavoriteChanged<T> value, $Res Function(FavoriteChanged<T>) _then) =
      _$FavoriteChangedCopyWithImpl;
  @useResult
  $Res call({String id, bool isFavorite});
}

/// @nodoc
class _$FavoriteChangedCopyWithImpl<T, $Res>
    implements $FavoriteChangedCopyWith<T, $Res> {
  _$FavoriteChangedCopyWithImpl(this._self, this._then);

  final FavoriteChanged<T> _self;
  final $Res Function(FavoriteChanged<T>) _then;

  /// Create a copy of FavoriteState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? isFavorite = null,
  }) {
    return _then(FavoriteChanged<T>(
      null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      null == isFavorite
          ? _self.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class FavoriteError<T> implements FavoriteState<T> {
  const FavoriteError(this.message);

  final String message;

  /// Create a copy of FavoriteState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FavoriteErrorCopyWith<T, FavoriteError<T>> get copyWith =>
      _$FavoriteErrorCopyWithImpl<T, FavoriteError<T>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FavoriteError<T> &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'FavoriteState<$T>.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $FavoriteErrorCopyWith<T, $Res>
    implements $FavoriteStateCopyWith<T, $Res> {
  factory $FavoriteErrorCopyWith(
          FavoriteError<T> value, $Res Function(FavoriteError<T>) _then) =
      _$FavoriteErrorCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$FavoriteErrorCopyWithImpl<T, $Res>
    implements $FavoriteErrorCopyWith<T, $Res> {
  _$FavoriteErrorCopyWithImpl(this._self, this._then);

  final FavoriteError<T> _self;
  final $Res Function(FavoriteError<T>) _then;

  /// Create a copy of FavoriteState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(FavoriteError<T>(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
