import 'package:flutter/material.dart';

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
