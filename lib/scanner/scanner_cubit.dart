import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

part 'scanner_cubit.freezed.dart';
part 'scanner_state.dart';

class ScannerCubit extends Cubit<ScannerState> {
  ScannerCubit() : super(const ScannerState.initial()) {
    lastCapture = null;
  }

  final MobileScannerController controller = MobileScannerController(
    returnImage: true,
    torchEnabled: false,
  );

  BarcodeCapture? lastCapture;
  bool isTorched = false;
  bool isFrontCamera = false;

  Future<void> toggleTorch() async {
    emit(const ScannerState.initial());
    await controller.toggleTorch();
    isTorched = !isTorched;
    emit(ScannerState.dataScanned(lastCapture?.barcodes ?? []));
  }

  void onCodeScanned(BarcodeCapture captured) {
    emit(const ScannerState.initial());
    lastCapture = captured;
    emit(ScannerState.dataScanned(captured.barcodes));
  }

  List<Offset> get corners {
    return lastCapture?.barcodes[0].corners ?? [];
  }

  void reset() {
    lastCapture = null;
    isTorched = false;
    isFrontCamera = false;
    emit(const ScannerState.initial());
  }

  void switchCamera() {
    emit(const ScannerState.initial());
    controller.switchCamera();
    isTorched = false;
    isFrontCamera = !isFrontCamera;
    emit(ScannerState.dataScanned(lastCapture?.barcodes ?? []));
  }
}
