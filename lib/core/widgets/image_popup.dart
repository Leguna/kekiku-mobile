import '../index.dart';

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
        GestureDetector(
          onTap: () => onBack?.call(),
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
                onTap: () => onTap?.call(),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: MyImageLoader(
                    path: imageUrl,
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
                    backgroundColor:
                        WidgetStateProperty.all(Colors.black.withAlpha(125)),
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                  icon: const Icon(Icons.close, color: Colors.white),
                  onPressed: () => onBack?.call(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
