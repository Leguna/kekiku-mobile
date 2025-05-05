import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MyImageLoader extends StatefulWidget {
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
  State<MyImageLoader> createState() => _MyImageLoaderState();
}

class _MyImageLoaderState extends State<MyImageLoader> {
  bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    if (widget.isLoading) {
      return _buildShimmer();
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(widget.radius),
      child: _buildImage(),
    );
  }

  Widget _buildNetworkImage() {
    return CachedNetworkImage(
      imageUrl: widget.path ?? '',
      memCacheHeight: widget.height.toInt() / 2 ~/ 1,
      memCacheWidth: widget.width / 2 ~/ 1,
      filterQuality: FilterQuality.none,
      imageBuilder: (context, imageProvider) {
        widget.onImageLoaded?.call();
        return Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.radius),
            image: DecorationImage(
              image: imageProvider,
              fit: widget.fit,
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

  Widget _buildImage() {
    return widget.path?.startsWith('http') ?? false
        ? _buildNetworkImage()
        : _buildLocalImage();
  }

  Widget _buildLocalImage() {
    if (_isLoading) {
      return _buildShimmer();
    }
    return FutureBuilder(
      future: Future.delayed(const Duration(milliseconds: 100)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          _onImageLoaded();
        }
        return Image.asset(
          widget.path ?? '',
          width: widget.width,
          height: widget.height,
          fit: widget.fit,
          errorBuilder: (context, error, stackTrace) =>
              _buildError(context, widget.path ?? '', error),
        );
      },
    );
  }

  void _onImageLoaded() {
    if (mounted) {
      setState(() {
        _isLoading = false;
      });
      widget.onImageLoaded?.call();
    }
  }

  Widget _buildShimmer() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.radius),
        color: Colors.grey[300],
      ),
      width: widget.width,
      height: widget.height,
    );
  }

  Widget _buildError(
    BuildContext context,
    String path,
    Object error,
  ) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.radius),
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
