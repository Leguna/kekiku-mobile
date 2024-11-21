import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../core/strings.dart';

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

  bool get isCaptured => lastCapture != null;
  BarcodeCapture? lastCapture;
  bool isTorched = false;
  bool isFrontCamera = false;
  Uint8List? imageFile;

  Uint8List? get image {
    if (lastCapture?.image != null) {
      return lastCapture?.image;
    } else if (imageFile != null) {
      return imageFile;
    }
    return null;
  }

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

  Future<void> pickImage() async {
    emit(const ScannerState.initial());
    final XFile? file =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (file?.path == null) emit(const ScannerState.error(Strings.noImageSelected));
    lastCapture = await controller.analyzeImage(file!.path);
    imageFile = await file.readAsBytes();
    emit(ScannerState.dataScanned(lastCapture?.barcodes ?? []));
  }
}
