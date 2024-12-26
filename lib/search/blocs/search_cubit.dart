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
  final PagingController<int, Product> pagingController =
      PagingController(firstPageKey: 1);

  String _query = '';
  Timer? _debounce;

  void init() {
    pagingController.refresh();
    pagingController.appendPage([], pagingController.nextPageKey);
  }

  void search() async {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 1000), () async {
      emit(const SearchState.loading());
      pagingController.itemList = [];
      pagingController.refresh();
      if (_query.isNotEmpty) {
        final responsePaging =
            await productRepository.searchProducts(query: _query);
        pagingController.appendLastPage(responsePaging.data.items);
        emit(SearchState.success(responsePaging.data.items));
      } else {
        pagingController.appendLastPage([]);
        emit(const SearchState.initial());
      }
    });
  }

  void type(String? value) {
    _query = value ?? '';
    search();
  }
}
