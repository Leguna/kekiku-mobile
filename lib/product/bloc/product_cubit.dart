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
  List<Product> popularProducts = <Product>[];

  Product? selectedProduct;
  Variant? selectedVariant;

  Future<void> refresh() async {
    products = [];
    pagingController.itemList = [];
    pagingController.refresh();
    await getProducts();
  }

  getPopularProducts() async {
    emit(const ProductState.loading());
    try {
      final response = await _productRepository.getPopularProducts();
      popularProducts = response.data.items;
      emit(ProductState.success(popularProducts));
    } catch (e) {
      emit(ProductState.error(e.toString()));
    }
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

  void selectProduct(Product product) {
    selectedProduct = product;
    emit(ProductState.selectedProduct(product));
  }

  void selectVariant(Variant variant) {
    selectedVariant = variant;
    emit(ProductState.selectedVariant(variant));
  }
}
