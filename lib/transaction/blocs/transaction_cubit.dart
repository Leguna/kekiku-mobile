import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kekiku/product/data_sources/product_repository.dart';

import '../../core/index.dart';

part 'transaction_cubit.freezed.dart';
part 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit() : super(const TransactionState.initial()) {
    fetchTransactions();
  }

  TextEditingController searchController = TextEditingController();
  List<Transaction> transactions = [];

  final ProductRepository productRepository = getIt<ProductRepository>();

  DateTime? startDateFilter;
  DateTime? endDateFilter;

  TransactionType typeFilter = TransactionType.none;
  TransactionStatus statusFilter = TransactionStatus.none;

  bool isFiltering() {
    return statusFilter != TransactionStatus.none ||
        typeFilter != TransactionType.none ||
        startDateFilter != null ||
        endDateFilter != null;
  }

  final Debouncer debouncer = Debouncer(milliseconds: 1000);

  get isQueryEmpty => searchController.text.isEmpty;

  void trySearchTransaction() async {
    emit(const TransactionState.loading());
    try {
      if (searchController.text.isEmpty) {
        emit(TransactionState.loaded(transactions));
        return;
      }
      debouncer.run(() async {
        emit(const TransactionState.loading());
        final filteredTransactions = await productRepository.getTransactions(
          query: searchController.text.toLowerCase(),
        );
        transactions = filteredTransactions;
        emit(TransactionState.loaded(filteredTransactions));
      });
    } catch (e) {
      emit(TransactionState.error(message: e.toString()));
    }
  }

  void clear({bool tags = false}) {
    emit(const TransactionState.loading());
    transactions = [];
    if (!tags) {
      searchController.clear();
      trySearchTransaction();
    }
    if (tags) {
      statusFilter = TransactionStatus.none;
      typeFilter = TransactionType.none;
      startDateFilter = null;
      endDateFilter = null;
    }
    emit(const TransactionState.updated());
  }

  void setDateTime(DateTime? startDate, DateTime? endDate) {
    emit(const TransactionState.loading());
    startDateFilter = startDate;
    endDateFilter = endDate;
    emit(const TransactionState.updated());
  }

  void setStatusFilter(TransactionStatus status) {
    emit(const TransactionState.loading());
    statusFilter = status;
    emit(const TransactionState.updated());
  }

  void setCategoryFilter(TransactionType type) {
    emit(const TransactionState.loading());
    typeFilter = type;
    emit(const TransactionState.updated());
  }

  void fetchTransactions() async {
    emit(const TransactionState.loading());
    try {
      final response = await productRepository.getTransactions();
      transactions = response;
      emit(TransactionState.loaded(transactions));
    } catch (e) {
      emit(TransactionState.error(message: e.toString()));
    }
  }
}
