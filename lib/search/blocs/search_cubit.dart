import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:kekiku/product/data_sources/product_repository.dart';

import '../../core/index.dart';

part 'search_cubit.freezed.dart';
part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(const SearchState.initial()) {
    init();
  }

  final ProductRepository productRepository = getIt<ProductRepository>();

  String _query = '';
  Timer? _debounce;

  PagingState<int, Product> pagingState = PagingState<int, Product>();

  void init() {
    pagingState = PagingState<int, Product>(
      hasNextPage: true,
      isLoading: false,
    );
  }

  void search() async {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 1000), () async {
      emit(const SearchState.loading());
      if (_query.isNotEmpty) {
        final responsePaging =
            await productRepository.searchProducts(query: _query);
        pagingState = pagingState.copyWith(
          hasNextPage: responsePaging.data.isLastPage,
          isLoading: false,
        );
        emit(SearchState.success(responsePaging.data.items));
      } else {
        emit(const SearchState.initial());
      }
    });
  }

  void type(String? value) {
    _query = value ?? '';
    search();
  }
}
