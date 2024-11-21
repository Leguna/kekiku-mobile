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
              if (haveData)
                Image.memory(
                  bloc.lastCapture!.image!,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Center(
                      child: Text('Could not decode image bytes. $error'),
                    );
                  },
                )
              else
                MobileScanner(
                  fit: BoxFit.cover,
                  onDetect: bloc.onCodeScanned,
                  controller: bloc.controller,
                ),
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
                    color: Colors.black.withOpacity(0.8),
                    padding: const EdgeInsets.all(16),
                    child: (haveData)
                        ? SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                ...state.when(
                                  initial: () => [],
                                  dataScanned: (barcodes) => barcodes
                                      .map(
                                        (e) => Text(
                                          e.rawValue.toString(),
                                          textAlign: TextAlign.center,
                                        ),
                                      )
                                      .toList(),
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
                                Strings.qrData,
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                Strings.qrHint,
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

  createCorner(
      Offset corner, BoxConstraints constraints, BuildContext context) {
    return Positioned(
      left: corner.dx,
      top: corner.dy,
      child: Container(
        width: 10,
        height: 10,
        color: Colors.green.withOpacity(0.5),
      ),
    );
  }
}
