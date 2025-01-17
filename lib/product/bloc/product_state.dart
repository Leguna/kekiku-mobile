part of 'product_cubit.dart';

@freezed
class ProductState with _$ProductState {
  const factory ProductState.initial() = _Initial;

  const factory ProductState.loading() = _Loading;

  const factory ProductState.success(
    List<Product> products, {
    @Default(false) bool isLastPage,
  }) = _Success;

  const factory ProductState.detail(Product product) = _Detail;

  const factory ProductState.error(String message) = _Error;

  const factory ProductState.selectedProduct(Product product) =
      _SelectedProduct;

  const factory ProductState.selectedVariant(Variant variant) =
      _SelectedVariant;
}
