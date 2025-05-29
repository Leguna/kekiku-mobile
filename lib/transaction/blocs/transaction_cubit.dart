import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kekiku/cart/data_sources/cart_repository.dart';

import '../../cart/models/transaction_search_params.dart';
import '../../core/index.dart';
import '../utils/transaction_utils.dart';

part 'transaction_cubit.freezed.dart';
part 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit() : super(const TransactionState.initial()) {
    fetchTransactions();
  }

  TextEditingController searchController = TextEditingController();
  List<Transaction> transactions = [];

  final CartRepository cartRepository = getIt<CartRepository>();

  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
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

  DateFilter dateFilter = DateFilter.none;
  DateFilter currentFilter = DateFilter.none;

  final Debouncer debouncer = Debouncer(milliseconds: 1000);

  get isQueryEmpty => searchController.text.isEmpty;

  Future<void> fetchTransactions() async {
    emit(const TransactionState.loading());
    try {
      final response = await cartRepository.getTransactions();
      transactions = response.data.items;
      emit(TransactionState.loaded(transactions));
    } catch (e) {
      emit(TransactionState.error(message: e.toString()));
    }
  }

  void trySearchTransaction() async {
    emit(const TransactionState.loading());
    try {
      if (searchController.text.isEmpty && !isFiltering()) {
        await fetchTransactions();
        emit(TransactionState.loaded(transactions));
        return;
      }
      debouncer.run(() async {
        emit(const TransactionState.loading());
        final filteredTransactions = await cartRepository.getTransactions(
          transactionSearchParams: TransactionSearchParams(
            query: searchController.text.toLowerCase(),
            status: statusFilter.value,
            type: typeFilter.value,
            startDate: startDateFilter,
            endDate: endDateFilter,
          ),
        );
        transactions = filteredTransactions.data.items;
        emit(TransactionState.loaded(transactions));
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
    }
    if (tags) {
      statusFilter = TransactionStatus.none;
      typeFilter = TransactionType.none;
      startDateFilter = null;
      endDateFilter = null;
      startDateController =
          TextEditingController(text: DateTime.now().toDateString());
      endDateController =
          TextEditingController(text: DateTime.now().toDateString());
      dateFilter = DateFilter.none;
      currentFilter = DateFilter.none;
    }
    trySearchTransaction();
    emit(const TransactionState.updated());
  }

  get getDateLabel {
    if (currentFilter == DateFilter.custom) {
      return "${startDateFilter?.toDateString()} - ${endDateFilter?.toDateString()}";
    }
    return currentFilter.text;
  }

  void chooseDateFilter(DateFilter dateFilter) {
    emit(const TransactionState.loading());
    this.dateFilter = dateFilter;
    if (dateFilter == DateFilter.custom &&
        startDateFilter == null &&
        endDateFilter == null) {
      startDateFilter = DateTime.now();
      endDateFilter = DateTime.now();
    }
    emit(const TransactionState.updated());
  }

  void confirmDateFilter({DateTime? startDateFilter, DateTime? endDateFilter}) {
    emit(const TransactionState.loading());
    currentFilter = dateFilter;
    switch (currentFilter) {
      case DateFilter.none:
        this.startDateFilter = null;
        this.endDateFilter = null;
        break;
      case DateFilter.last30Days:
        this.startDateFilter =
            DateTime.now().subtract(const Duration(days: 30));
        this.endDateFilter = DateTime.now();
        break;
      case DateFilter.last60Days:
        this.startDateFilter =
            DateTime.now().subtract(const Duration(days: 60));
        this.endDateFilter = DateTime.now();
        break;
      case DateFilter.last90Days:
        this.startDateFilter =
            DateTime.now().subtract(const Duration(days: 90));
        this.endDateFilter = DateTime.now();
        break;
      case DateFilter.custom:
        if (startDateFilter != null && endDateFilter != null) {
          if (startDateFilter.isAfter(endDateFilter)) {
            this.startDateFilter = endDateFilter;
            startDateController.text = endDateFilter.toDateString();
          }
        }
        break;
    }
    trySearchTransaction();
    emit(const TransactionState.updated());
  }

  void setCustomDateFilter() {
    if (dateFilter == DateFilter.custom) {
      emit(const TransactionState.loading());
      if (startDateFilter != null && endDateFilter != null) {
        startDateFilter = DateTime.now();
        endDateFilter = DateTime.now();
      }
      startDateController.text = startDateFilter?.toDateString() ?? "";
      endDateController.text = endDateFilter?.toDateString() ?? "";
      emit(const TransactionState.updated());
    }
  }

  void initView() {
    searchController = TextEditingController();
    startDateController =
        TextEditingController(text: DateTime.now().toDateString());
    endDateController =
        TextEditingController(text: DateTime.now().toDateString());
    searchController.addListener(() {
      trySearchTransaction();
    });
  }

  void dispose() {
    searchController.dispose();
    startDateController.dispose();
    endDateController.dispose();
  }

  void changeTypeFilter(TransactionType value) {
    emit(const TransactionState.loading());
    typeFilter = value;
    trySearchTransaction();
    emit(const TransactionState.updated());
  }

  void changeStatusFilter(TransactionStatus value) {
    emit(const TransactionState.loading());
    statusFilter = value;
    trySearchTransaction();
    emit(const TransactionState.updated());
  }

  Future<void> cancelTransaction(String id) async {
    emit(TransactionState.loading(transactionId: id));
    try {
      final transaction = transactions.firstWhere((t) => t.id == id);
      await cartRepository.cancelTransaction(transaction);
      await fetchTransactions();
    } catch (e) {
      emit(TransactionState.error(message: e.toString()));
    }
  }

  Future<void> finishTransaction(String id) async {
    emit(TransactionState.loading(transactionId: id));
    try {
      final transaction = transactions.firstWhere((t) => t.id == id);
      await cartRepository.finishTransaction(transaction);
      await fetchTransactions();
      emit (TransactionState.finishSuccess(transactionId: id));
    } catch (e) {
      emit(TransactionState.error(message: e.toString()));
    }
  }

  Future<void> buyAgainFromTransaction(String transactionId) async {
    if (transactionId.isEmpty) {
      emit(TransactionState.error(message: "Transaction ID cannot be empty"));
      return;
    }
    emit(TransactionState.loading(transactionId: transactionId));
    final response =
        await cartRepository.buyAgainFromTransaction(transactionId);
    response.when(
      success: (data) {
        emit(TransactionState.buyAgainSuccess());
      },
      failure: (failure) {
        emit(TransactionState.error(message: failure));
      },
    );
  }
}
