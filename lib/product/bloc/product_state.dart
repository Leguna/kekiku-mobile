part of 'product_cubit.dart';

@freezed
class ProductState with _$ProductState {
  const factory ProductState.initial() = _Initial;

  const factory ProductState.loading() = _Loading;

  const factory ProductState.success(
    List<Product> products, {
    @Default(false) bool isLastPage,
    PagingState<int, Product>? pagingState,
    @Default([]) List<Product> popularProducts,
  }) = ProductSuccess;

  const factory ProductState.detail(Product product) = ProductDetail;

  const factory ProductState.error(String message) = _Error;

  const factory ProductState.selectedProduct(Product product) = SelectedProduct;

  const factory ProductState.selectedVariant(Variant variant) = SelectedVariant;

  const factory ProductState.outOfStock() = _OutOfStock;
}
