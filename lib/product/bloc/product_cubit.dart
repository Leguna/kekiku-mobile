import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:kekiku/product/data_sources/product_repository.dart';

import '../../core/index.dart';

part 'product_cubit.freezed.dart';
part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(const ProductState.initial());
  final ProductRepository _productRepository = getIt<ProductRepository>();

  List<Product> products = [];
  List<Product> popularProducts = <Product>[];
  PagingState<int, Product> pagingState = PagingState();

  Product? selectedProduct;
  Variant? selectedVariant;

  Future<void> refresh() async {
    products = [];
    popularProducts = [];
    await getProducts();
  }

  getPopularProducts() async {
    emit(const ProductState.loading());
    try {
      final response = await _productRepository.getPopularProducts();
      final newKey = (pagingState.keys?.last ?? 0) + 1;
      popularProducts = response.data.items;
      pagingState = pagingState.copyWith(
        pages: [...?pagingState.pages, popularProducts],
        keys: [...?pagingState.keys, newKey],
        hasNextPage: !response.data.isLastPage,
        isLoading: false,
      );
      emit(ProductState.success(popularProducts, pagingState: pagingState));
    } catch (e) {
      emit(ProductState.error(e.toString()));
    }
  }

  Future<void> getProducts({pageKey = 1}) async {
    emit(const ProductState.loading());
    try {
      final response = await _productRepository.getProducts(page: 1);
      products = response.data.items;
      pagingState = pagingState.copyWith(
        pages: [...?pagingState.pages, products],
        keys: [...?pagingState.keys, pageKey],
        hasNextPage: !response.data.isLastPage,
        isLoading: false,
      );
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
