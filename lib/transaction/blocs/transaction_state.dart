part of 'transaction_cubit.dart';

@freezed
class TransactionState with _$TransactionState {
  const factory TransactionState.initial() = _Initial;

  const factory TransactionState.loading() = _Loading;

  const factory TransactionState.updated() = _Updated;

  const factory TransactionState.loaded(List<Transaction> transactions) =
      _Loaded;

  const factory TransactionState.error({required String message}) = _Error;

  const factory TransactionState.buyAgainSuccess() = _BuyAgainSuccess;
}
