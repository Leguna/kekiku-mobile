import 'package:flutter/material.dart';
import 'package:kekiku/core/index.dart';
import 'package:kekiku/scanner/scanner_cubit.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScannerScreen extends StatelessWidget {
  const ScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = ScannerCubit();
    return MyScaffold(
      appBar: AppBar(
        title: const Text(Strings.codeScanner),
      ),
      body: BlocConsumer<ScannerCubit, ScannerState>(
        bloc: bloc,
        listener: (context, state) {},
        builder: (context, state) {
          var haveData = bloc.lastCapture != null;
          return Stack(
            fit: StackFit.expand,
            children: [
              if (haveData && bloc.lastCapture?.image != null)
                Image.memory(
                  bloc.lastCapture!.image!,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Center(
                      child: Text('Could not decode image bytes. $error'),
                    );
                  },
                )
              else if (haveData && bloc.image != null)
                Image.memory(
                  bloc.image!,
                  fit: BoxFit.cover,
                )
              else
                MobileScanner(
                  fit: BoxFit.cover,
                  onDetect: bloc.onCodeScanned,
                  controller: bloc.controller,
                ),
              const ClippedScannerOverlay(),
              if (!haveData)
                Positioned(
                  top: 16,
                  right: 16,
                  child: Column(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.rotate_right),
                        onPressed: () {
                          bloc.switchCamera();
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.image),
                        onPressed: () {
                          bloc.pickImage();
                        },
                      ),
                      if (!bloc.isFrontCamera)
                        IconButton(
                          icon: Icon(
                            bloc.isTorched ? Icons.flash_on : Icons.flash_off,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            bloc.toggleTorch();
                          },
                        ),
                    ],
                  ),
                ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: double.infinity,
                    color: Colors.black.withOpacity(0.6),
                    padding: const EdgeInsets.all(16),
                    child: (haveData)
                        ? SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                ...state.maybeWhen(
                                  initial: () => [],
                                  dataScanned: (barcodes) => barcodes
                                      .map(
                                        (e) => Text(
                                          e.rawValue.toString(),
                                          textAlign: TextAlign.center,
                                        ),
                                      )
                                      .toList(),
                                  orElse: () => [],
                                ),
                                const SizedBox(height: Dimens.small),
                                ElevatedButton(
                                  onPressed: () {
                                    bloc.reset();
                                  },
                                  child: const Text(Strings.readAgain),
                                ),
                              ],
                            ),
                          )
                        : const Column(
                            children: [
                              Text(
                                Strings.scanDataShowedHere,
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                Strings.scanHint,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}


class ClippedScannerOverlay extends StatelessWidget {
  const ClippedScannerOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ScannerOverlayClipper(),
      child: Container(
        color: Colors.black.withOpacity(0.6),
      ),
    );
  }
}

class ScannerOverlayClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final double rectSize = size.width * 0.6;
    final double left = (size.width - rectSize) / 2;
    final double top = (size.height - rectSize) / 2;

    final Path path = Path()
      ..addRect(Rect.fromLTWH(0, 0, size.width, size.height))
      ..addRect(Rect.fromLTWH(left, top, rectSize, rectSize))
      ..fillType = PathFillType.evenOdd;

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
