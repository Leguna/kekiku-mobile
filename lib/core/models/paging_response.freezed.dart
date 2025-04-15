// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paging_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PagingResponse<T> {
  int get currentPage;

  int get totalPages;

  int get pageSize;

  int get totalItems;

  List<T> get items;

  /// Create a copy of PagingResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PagingResponseCopyWith<T, PagingResponse<T>> get copyWith =>
      _$PagingResponseCopyWithImpl<T, PagingResponse<T>>(
          this as PagingResponse<T>, _$identity);

  /// Serializes this PagingResponse to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PagingResponse<T> &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            (identical(other.totalItems, totalItems) ||
                other.totalItems == totalItems) &&
            const DeepCollectionEquality().equals(other.items, items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, currentPage, totalPages,
      pageSize, totalItems, const DeepCollectionEquality().hash(items));

  @override
  String toString() {
    return 'PagingResponse<$T>(currentPage: $currentPage, totalPages: $totalPages, pageSize: $pageSize, totalItems: $totalItems, items: $items)';
  }
}

/// @nodoc
abstract mixin class $PagingResponseCopyWith<T, $Res> {
  factory $PagingResponseCopyWith(PagingResponse<T> value,
      $Res Function(PagingResponse<T>) _then) =
  _$PagingResponseCopyWithImpl;
  @useResult
  $Res call(
      {int currentPage,
      int totalPages,
      int pageSize,
      int totalItems,
      List<T> items});
}

/// @nodoc
class _$PagingResponseCopyWithImpl<T, $Res>
    implements $PagingResponseCopyWith<T, $Res> {
  _$PagingResponseCopyWithImpl(this._self, this._then);

  final PagingResponse<T> _self;
  final $Res Function(PagingResponse<T>) _then;

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
    return _then(_self.copyWith(
      currentPage: null == currentPage
          ? _self.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _self.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      pageSize: null == pageSize
          ? _self.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
      totalItems: null == totalItems
          ? _self.totalItems
          : totalItems // ignore: cast_nullable_to_non_nullable
              as int,
      items: null == items
          ? _self.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<T>,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _PagingResponse<T> extends PagingResponse<T> {
  const _PagingResponse(
      {this.currentPage = 1,
      this.totalPages = 1,
      this.pageSize = 10,
      this.totalItems = 0,
      final List<T> items = const []})
      : _items = items,
        super._();

  factory _PagingResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$PagingResponseFromJson(json, fromJsonT);

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

  /// Create a copy of PagingResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PagingResponseCopyWith<T, _PagingResponse<T>> get copyWith =>
      __$PagingResponseCopyWithImpl<T, _PagingResponse<T>>(this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$PagingResponseToJson<T>(this, toJsonT);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PagingResponse<T> &&
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

  @override
  String toString() {
    return 'PagingResponse<$T>(currentPage: $currentPage, totalPages: $totalPages, pageSize: $pageSize, totalItems: $totalItems, items: $items)';
  }
}

/// @nodoc
abstract mixin class _$PagingResponseCopyWith<T, $Res>
    implements $PagingResponseCopyWith<T, $Res> {
  factory _$PagingResponseCopyWith(
          _PagingResponse<T> value, $Res Function(_PagingResponse<T>) _then) =
      __$PagingResponseCopyWithImpl;
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
class __$PagingResponseCopyWithImpl<T, $Res>
    implements _$PagingResponseCopyWith<T, $Res> {
  __$PagingResponseCopyWithImpl(this._self, this._then);

  final _PagingResponse<T> _self;
  final $Res Function(_PagingResponse<T>) _then;

  /// Create a copy of PagingResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? currentPage = null,
    Object? totalPages = null,
    Object? pageSize = null,
    Object? totalItems = null,
    Object? items = null,
  }) {
    return _then(_PagingResponse<T>(
      currentPage: null == currentPage
          ? _self.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _self.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      pageSize: null == pageSize
          ? _self.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
      totalItems: null == totalItems
          ? _self.totalItems
          : totalItems // ignore: cast_nullable_to_non_nullable
              as int,
      items: null == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<T>,
    ));
  }
}

// dart format on
