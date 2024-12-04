import 'package:cached_network_image/cached_network_image.dart';
import 'package:kekiku/core/index.dart';

class ImageTitle extends StatelessWidget {
  const ImageTitle({
    super.key,
    this.image = '',
    this.title = '',
    this.subtitle = '',
    this.size = 60.0,
  });

  final double size;
  final String image;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(30.0),
          child: image.isEmpty
              // Get image placeholder if image is empty from url or local https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png
              ? Assets.noImage.image(
                  width: size,
                  height: size,
                  fit: BoxFit.cover,
                )
              : CachedNetworkImage(
                  imageUrl: (removeNewLine(image)),
                  height: size,
                  width: size,
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) => Assets.noImage.image(
                    width: size,
                    height: size,
                    fit: BoxFit.cover,
                  ),
                ),
        ),
        const SizedBox(width: 16.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                overflow: TextOverflow.ellipsis,
              ),
              if (subtitle.isNotEmpty)
                Text(
                  subtitle,
                  overflow: TextOverflow.ellipsis,
                ),
            ],
          ),
        ),
      ],
    );
  }
}
