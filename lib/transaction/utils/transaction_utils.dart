enum DateFilter {
  none,
  last30Days,
  last60Days,
  last90Days,
  custom,
}

extension DateFilterExtension on DateFilter {
  DateTime? get startDate {
    switch (this) {
      case DateFilter.none:
        return null;
      case DateFilter.last30Days:
        return DateTime.now().subtract(const Duration(days: 30));
      case DateFilter.last60Days:
        return DateTime.now().subtract(const Duration(days: 60));
      case DateFilter.last90Days:
        return DateTime.now().subtract(const Duration(days: 90));
      case DateFilter.custom:
        return null;
    }
  }

  String get text {
    switch (this) {
      case DateFilter.none:
        return "All Date";
      case DateFilter.last30Days:
        return "Last 30 Days";
      case DateFilter.last60Days:
        return "Last 60 Days";
      case DateFilter.last90Days:
        return "Last 90 Days";
      case DateFilter.custom:
        return "Custom";
    }
  }
}
