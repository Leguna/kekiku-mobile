import 'package:flutter/material.dart';

class ImagePopup extends StatelessWidget {
  const ImagePopup({
    super.key,
    required this.imageUrl,
    this.imageSize = 120,
    this.onTap,
    this.onBack,
  });

  final String imageUrl;
  final double imageSize;
  final Function? onTap;
  final Function? onBack;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: GestureDetector(
            onTap: () {
              onBack?.call();
            },
            child: Container(
              color: Colors.black.withAlpha(127),
            ),
          ),
        ),
        Center(
          child: GestureDetector(
            onTap: () {
              onTap?.call();
            },
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
              // Close button
              child: Container(
                alignment: Alignment.topRight,
                padding: const EdgeInsets.all(8),
                child: IconButton(
                  style: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.all(Colors.black.withAlpha(125)),
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    onBack?.call();
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

showImagePopup(BuildContext context, String imageUrl) {
  showDialog(
    context: context,
    builder: (context) {
      return ImagePopup(imageUrl: imageUrl);
    },
  );
}
