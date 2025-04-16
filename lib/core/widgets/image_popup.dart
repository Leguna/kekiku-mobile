import '../index.dart';

class ImagePopup extends StatefulWidget {
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
  State<ImagePopup> createState() => _ImagePopupState();
}

class _ImagePopupState extends State<ImagePopup> {
  late Future<void> _imageLoadFuture;

  @override
  void initState() {
    super.initState();
    _imageLoadFuture = _preloadImage(widget.imageUrl);
  }

  Future<void> _preloadImage(String url) async {
    final image = NetworkImage(url, scale: widget.imageSize);
    await precacheImage(image, context);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: _imageLoadFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const SizedBox.shrink();
        }

        return Stack(
          children: [
            GestureDetector(
              onTap: () => widget.onBack?.call(),
              child: Container(
                color: Colors.black.withAlpha(127),
                width: double.infinity,
                height: double.infinity,
              ),
            ),
            Center(
              child: Stack(
                children: [
                  GestureDetector(
                    onTap: () => widget.onTap?.call(),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        widget.imageUrl,
                        scale: widget.imageSize,
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width * 0.7,
                        height: MediaQuery.of(context).size.height * 0.4,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: IconButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(Colors.black.withAlpha(125)),
                        shape: WidgetStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                      icon: const Icon(Icons.close, color: Colors.white),
                      onPressed: () => widget.onBack?.call(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}