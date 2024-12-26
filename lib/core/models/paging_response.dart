import 'package:freezed_annotation/freezed_annotation.dart';

part 'paging_response.freezed.dart';
part 'paging_response.g.dart';

@Freezed(genericArgumentFactories: true)
class PagingResponse<T> with _$PagingResponse<T> {
  const factory PagingResponse({
    @Default(1) int currentPage,
    @Default(1) int totalPages,
    @Default(10) int pageSize,
    @Default(0) int totalItems,
    @Default([]) List<T> items,
  }) = _PagingResponse<T>;

  const PagingResponse._();

  bool get isLastPage => currentPage == totalPages;

  factory PagingResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) =>
      _$PagingResponseFromJson(json, fromJsonT);
}
