import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:kekiku/product/data_sources/product_repository.dart';

import '../../core/index.dart';

part 'product_cubit.freezed.dart';
part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(const ProductState.initial()) {
    getProducts();
    getPopularProducts();
  }

  final ProductRepository _productRepository = getIt<ProductRepository>();

  List<Product> products = [];
  List<Product> popularProducts = <Product>[];
  PagingState<int, Product> pagingState = PagingState();

  Product? selectedProduct;
  Variant? selectedVariant;

  Future<void> refresh() async {
    products = [];
    popularProducts = [];
    pagingState = PagingState();
    await getProducts();
    await getPopularProducts();
  }

  Future<void> getPopularProducts() async {
    try {
      emit(const ProductState.loading());
      final response = await _productRepository.getPopularProducts();
      popularProducts = response.data.items;
      emit(ProductState.success(
        products,
        pagingState: pagingState,
        popularProducts: popularProducts,
      ));
    } catch (e) {
      emit(ProductState.error(e.toString()));
    }
  }

  Future<void> getProducts({pageKey = 1}) async {
    emit(const ProductState.loading());
    try {
      final response = await _productRepository.getProducts(page: pageKey);
      if (pageKey == 1) {
        products = [];
        pagingState = PagingState();
      }
      products = response.data.items;

      pagingState = pagingState.copyWith(
        pages: [...?pagingState.pages, products],
        keys: [...?pagingState.keys, pageKey],
        hasNextPage: !response.data.isLastPage,
        isLoading: false,
      );

      emit(
        ProductState.success(
          products,
          isLastPage: response.data.isLastPage,
          popularProducts: popularProducts,
          pagingState: pagingState,
        ),
      );
    } catch (e) {
      emit(ProductState.error(e.toString()));
    }
  }

  void selectProduct(Product product) {
    selectedProduct = product;
    selectedVariant = product.variants.first;
    emit(ProductState.selectedProduct(product));
  }

  void selectVariant(Variant variant) {
    selectedVariant = variant;
    emit(ProductState.selectedVariant(variant));
  }
}
