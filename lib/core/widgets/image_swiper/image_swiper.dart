import 'package:flutter/material.dart';
import 'package:kekiku/core/widgets/image_swiper/dots_indicator_with_timer.dart';

import '../../index.dart';

class ImageSwiper extends StatelessWidget {
  const ImageSwiper({
    super.key,
    this.height = 200,
    this.data = const [],
    this.showIndicator = true,
    this.delay = 3,
  });

  final double height;
  final List<ImageData> data;
  final bool showIndicator;
  final int delay;

  @override
  Widget build(BuildContext context) {
    final controller = PageController();
    return SizedBox(
      width: double.infinity,
      height: height,
      child: Stack(
        children: [
          PageView.builder(
            controller: controller,
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Stack(
                alignment: Alignment.bottomLeft,
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    data[index].image,
                    fit: BoxFit.cover,
                  ),
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.8),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomLeft,
                    padding: EdgeInsets.only(
                      left: Dimens.medium,
                      right: Dimens.medium,
                      bottom: showIndicator ? Dimens.large : Dimens.medium,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          data[index].title,
                          style: Theme.of(context).textTheme.titleLarge,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          data[index].subtitle,
                          style: Theme.of(context).textTheme.titleMedium,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
          if (showIndicator)
            Positioned(
              bottom: Dimens.small,
              left: 0,
              right: 0,
              child: Center(
                child: DotsIndicatorWithTimer(
                  controller: controller,
                  itemCount: data.length,
                  color: Colors.white,
                  duration: const Duration(seconds: 5),
                  onPageSelected: (index) {
                    controller.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class ImageData {
  const ImageData({
    this.image = '',
    this.title = '',
    this.subtitle = '',
  });

  final String image;
  final String title;
  final String subtitle;
}
