class TransactionSearchParams {
  final String query;
  final String status;
  final String type;
  final DateTime? startDate;
  final DateTime? endDate;

  const TransactionSearchParams({
    this.query = '',
    this.status = '',
    this.type = '',
    this.startDate,
    this.endDate,
  });
}
