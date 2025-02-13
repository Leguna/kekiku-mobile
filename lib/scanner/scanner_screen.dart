import 'package:kekiku/core/index.dart';
import 'package:kekiku/scanner/scanner_cubit.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import 'clipped_scanner_overlay.dart';

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
          return Stack(
            fit: StackFit.expand,
            children: [
              _buildImageScanner(bloc, state),
              const ClippedScannerOverlay(),
              if (!bloc.isCaptured) _buildIconButtons(bloc, state),
              _buildBottomInfo(state, bloc),
            ],
          );
        },
      ),
    );
  }

  Column _buildBottomInfo(ScannerState state, ScannerCubit bloc) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: double.infinity,
          color: Colors.black.withAlpha(150),
          padding: const EdgeInsets.all(16),
          child: (bloc.isCaptured)
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
    );
  }

  _buildImageScanner(ScannerCubit bloc, ScannerState state) {
    if (bloc.isCaptured && bloc.lastCapture?.image != null) {
      return Image.memory(
        bloc.lastCapture!.image!,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Center(
            child: Text('Could not decode image bytes. $error'),
          );
        },
      );
    } else if (bloc.isCaptured && bloc.image != null) {
      return Image.memory(
        bloc.image!,
        fit: BoxFit.cover,
      );
    } else {
      return MobileScanner(
        fit: BoxFit.cover,
        onDetect: bloc.onCodeScanned,
        controller: bloc.controller,
      );
    }
  }

  _buildIconButtons(ScannerCubit bloc, ScannerState state) {
    return Positioned(
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
    );
  }
}
