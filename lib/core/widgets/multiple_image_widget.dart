import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../gen/assets.gen.dart';
import 'my_shimmer.dart';

class MultipleImageWidget extends StatelessWidget {
  const MultipleImageWidget({super.key, this.images = const []});

  final List<String> images;

  final lineSize = 1.0;
  final double size = 50;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: lineSize),
        borderRadius: BorderRadius.circular(100.0),
        color: Colors.grey.withOpacity(0.5),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100.0),
        child: buildGrid(),
      ),
    );
  }

  Widget buildGrid() {
    switch (images.length) {
      case 0:
        return Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(50.0),
          ),
          child: const Icon(
            Icons.groups_rounded,
            color: Colors.white,
          ),
        );
      case 1:
        return buildImage(
          images[0],
        );
      case 2:
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: buildImage(
                images[0],
              ),
            ),
            Container(
              height: size,
              width: lineSize,
              foregroundDecoration: const BoxDecoration(color: Colors.black),
            ),
            Expanded(
              child: buildImage(
                images[1],
              ),
            ),
          ],
        );
      default:
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: buildImage(images[0])),
            Container(
              width: lineSize,
              height: size + (lineSize * 6),
              foregroundDecoration: const BoxDecoration(color: Colors.black),
            ),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: buildImage(
                      images[1],
                    ),
                  ),
                  Container(
                    height: lineSize,
                    width: size / 2 + lineSize * 2,
                    foregroundDecoration:
                        const BoxDecoration(color: Colors.black),
                  ),
                  Expanded(
                    child: buildImage(
                      images[2],
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
    }
  }

  Widget buildImage(String? url) {
    if (url == null || url.isEmpty) {
      return Assets.noimage.image(
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
      );
    }
    return CachedNetworkImage(
      height: double.infinity,
      width: double.infinity,
      imageUrl: url,
      fit: BoxFit.cover,
      errorWidget: (context, url, error) => Assets.noimage.image(
        height: double.infinity,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
      placeholder: (context, url) => const SizedBox(
        child: MyShimmer(),
      ),
    );
  }
}
