part of 'scanner_cubit.dart';

@freezed
class ScannerState with _$ScannerState {
  const factory ScannerState.initial() = _Initial;
  const factory ScannerState.dataScanned(List<Barcode> barcodes) = _DataScanned;
}
