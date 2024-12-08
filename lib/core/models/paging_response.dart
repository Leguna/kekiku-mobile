import 'package:freezed_annotation/freezed_annotation.dart';

part 'paging_response.freezed.dart';
part 'paging_response.g.dart';

@Freezed(genericArgumentFactories: true)
class PagingResponse<T> with _$PagingResponse<T> {
  const factory PagingResponse({
    required int currentPage,
    required int totalPages,
    required int pageSize,
    required int totalItems,
    required List<T> items,
  }) = _PagingResponse<T>;

  const PagingResponse._();

  bool get isLastPage => currentPage == totalPages;

  factory PagingResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) =>
      _$PagingResponseFromJson(json, fromJsonT);
}
