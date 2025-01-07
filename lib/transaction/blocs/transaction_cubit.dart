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

  String statusFilter = '';
  String categoryFilter = '';
  DateTime? startDateFilter;
  DateTime? endDateFilter;

  bool isFiltering() {
    return statusFilter.isNotEmpty ||
        categoryFilter.isNotEmpty ||
        startDateFilter != null ||
        endDateFilter != null ||
        searchController.text.isNotEmpty;
  }

  void trySearchTransaction() {
    try {} catch (e) {
      emit(TransactionState.error(message: e.toString()));
    }
  }

  void clear({bool tags = false}) {
    transactions = [];
    if (!tags) searchController.clear();
    if (tags) {
      statusFilter = '';
      categoryFilter = '';
      startDateFilter = null;
      endDateFilter = null;
    }
  }

  void setDateTime(DateTime? startDate, DateTime? endDate) {
    emit(const TransactionState.loading());
    startDateFilter = startDate;
    endDateFilter = endDate;
    emit(const TransactionState.updated());
  }

  void setStatusFilter(String status) {
    emit(const TransactionState.loading());
    statusFilter = status;
    emit(const TransactionState.updated());
  }

  void setCategoryFilter(String category) {
    emit(const TransactionState.loading());
    categoryFilter = category;
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
