import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MyImageLoader extends StatelessWidget {
  const MyImageLoader({
    super.key,
    this.path = '',
    this.width = 100,
    this.height = 100,
    this.radius = 8,
    this.onImageLoaded,
    this.isLoading = false,
    this.fit = BoxFit.cover,
  });

  final String? path;
  final double width;
  final double height;
  final double radius;
  final bool isLoading;
  final Function()? onImageLoaded;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: _buildImage(),
    );
  }

  Widget _buildImage() {
    return path?.startsWith('http') ?? false
        ? _buildNetworkImage()
        : _buildLocalImage();
  }

  Widget _buildNetworkImage() {
    return CachedNetworkImage(
      imageUrl: path ?? '',
      filterQuality: FilterQuality.none,
      imageBuilder: (context, imageProvider) {
        onImageLoaded?.call();
        return Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            image: DecorationImage(
              image: imageProvider,
              fit: fit,
            ),
          ),
        );
      },
      placeholder: (context, url) {
        return _buildShimmer();
      },
      errorWidget: (context, url, error) => _buildError(context, url, error),
    );
  }

  Widget _buildLocalImage() {
    return Image.asset(
      path ?? '',
      width: width,
      height: height,
      fit: fit,
      errorBuilder: (context, error, stackTrace) =>
          _buildError(context, path ?? '', error),
    );
  }

  Widget _buildShimmer() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: Colors.grey[300],
      ),
      width: width,
      height: height,
    );
  }

  Widget _buildError(
    BuildContext context,
    String path,
    Object error,
  ) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: Colors.grey[300],
      ),
      child: const Center(
        child: Icon(
          Icons.error,
          color: Colors.red,
        ),
      ),
    );
  }
}
