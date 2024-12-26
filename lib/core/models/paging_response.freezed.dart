// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paging_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PagingResponse<T> _$PagingResponseFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  return _PagingResponse<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$PagingResponse<T> {
  int get currentPage => throw _privateConstructorUsedError;
  int get totalPages => throw _privateConstructorUsedError;
  int get pageSize => throw _privateConstructorUsedError;
  int get totalItems => throw _privateConstructorUsedError;
  List<T> get items => throw _privateConstructorUsedError;

  /// Serializes this PagingResponse to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;

  /// Create a copy of PagingResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PagingResponseCopyWith<T, PagingResponse<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PagingResponseCopyWith<T, $Res> {
  factory $PagingResponseCopyWith(
          PagingResponse<T> value, $Res Function(PagingResponse<T>) then) =
      _$PagingResponseCopyWithImpl<T, $Res, PagingResponse<T>>;
  @useResult
  $Res call(
      {int currentPage,
      int totalPages,
      int pageSize,
      int totalItems,
      List<T> items});
}

/// @nodoc
class _$PagingResponseCopyWithImpl<T, $Res, $Val extends PagingResponse<T>>
    implements $PagingResponseCopyWith<T, $Res> {
  _$PagingResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PagingResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = null,
    Object? totalPages = null,
    Object? pageSize = null,
    Object? totalItems = null,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
      totalItems: null == totalItems
          ? _value.totalItems
          : totalItems // ignore: cast_nullable_to_non_nullable
              as int,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<T>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PagingResponseImplCopyWith<T, $Res>
    implements $PagingResponseCopyWith<T, $Res> {
  factory _$$PagingResponseImplCopyWith(_$PagingResponseImpl<T> value,
          $Res Function(_$PagingResponseImpl<T>) then) =
      __$$PagingResponseImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {int currentPage,
      int totalPages,
      int pageSize,
      int totalItems,
      List<T> items});
}

/// @nodoc
class __$$PagingResponseImplCopyWithImpl<T, $Res>
    extends _$PagingResponseCopyWithImpl<T, $Res, _$PagingResponseImpl<T>>
    implements _$$PagingResponseImplCopyWith<T, $Res> {
  __$$PagingResponseImplCopyWithImpl(_$PagingResponseImpl<T> _value,
      $Res Function(_$PagingResponseImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of PagingResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = null,
    Object? totalPages = null,
    Object? pageSize = null,
    Object? totalItems = null,
    Object? items = null,
  }) {
    return _then(_$PagingResponseImpl<T>(
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
      totalItems: null == totalItems
          ? _value.totalItems
          : totalItems // ignore: cast_nullable_to_non_nullable
              as int,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<T>,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$PagingResponseImpl<T> extends _PagingResponse<T> {
  const _$PagingResponseImpl({this.currentPage = 1,
    this.totalPages = 1,
    this.pageSize = 10,
    this.totalItems = 0,
    final List<T> items = const []})
      : _items = items,
        super._();

  factory _$PagingResponseImpl.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$PagingResponseImplFromJson(json, fromJsonT);

  @override
  @JsonKey()
  final int currentPage;
  @override
  @JsonKey()
  final int totalPages;
  @override
  @JsonKey()
  final int pageSize;
  @override
  @JsonKey()
  final int totalItems;
  final List<T> _items;
  @override
  @JsonKey()
  List<T> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'PagingResponse<$T>(currentPage: $currentPage, totalPages: $totalPages, pageSize: $pageSize, totalItems: $totalItems, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PagingResponseImpl<T> &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            (identical(other.totalItems, totalItems) ||
                other.totalItems == totalItems) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, currentPage, totalPages,
      pageSize, totalItems, const DeepCollectionEquality().hash(_items));

  /// Create a copy of PagingResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PagingResponseImplCopyWith<T, _$PagingResponseImpl<T>> get copyWith =>
      __$$PagingResponseImplCopyWithImpl<T, _$PagingResponseImpl<T>>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$PagingResponseImplToJson<T>(this, toJsonT);
  }
}

abstract class _PagingResponse<T> extends PagingResponse<T> {
  const factory _PagingResponse({final int currentPage,
    final int totalPages,
    final int pageSize,
    final int totalItems,
    final List<T> items}) = _$PagingResponseImpl<T>;
  const _PagingResponse._() : super._();

  factory _PagingResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$PagingResponseImpl<T>.fromJson;

  @override
  int get currentPage;
  @override
  int get totalPages;
  @override
  int get pageSize;
  @override
  int get totalItems;
  @override
  List<T> get items;

  /// Create a copy of PagingResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PagingResponseImplCopyWith<T, _$PagingResponseImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
