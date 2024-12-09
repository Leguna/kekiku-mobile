import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:kekiku/product/data_sources/product_repository.dart';

import '../../core/index.dart';

part 'product_cubit.freezed.dart';
part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(const ProductState.initial());

  final PagingController<int, Product> pagingController =
      PagingController(firstPageKey: 0);
  final ProductRepository _productRepository = getIt<ProductRepository>();

  List<Product> products = [];

  Future<void> refresh() async {
    products = [];
    pagingController.itemList = [];
    pagingController.refresh();
    await getProducts();
  }

  Future<void> getProducts() async {
    emit(const ProductState.loading());
    try {
      final response = await _productRepository.getProducts();
      products = response.data.items;
      if (response.data.isLastPage) {
        pagingController.appendLastPage(products);
      } else {
        pagingController.appendPage(products, 0);
      }
      emit(
        ProductState.success(products, isLastPage: response.data.isLastPage),
      );
    } catch (e) {
      emit(ProductState.error(e.toString()));
    }
  }
}
