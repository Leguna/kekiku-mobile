import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:kekiku/core/widgets/image_swiper/dots_indicator_with_timer.dart';

import '../../index.dart';

class ImageSwiper extends StatelessWidget {
  const ImageSwiper({
    super.key,
    this.height = 180,
    this.data = const [],
    this.showIndicator = true,
    this.delay = 5,
  });

  final double height;
  final List<ImageData> data;
  final bool showIndicator;
  final int delay;

  @override
  Widget build(BuildContext context) {
    final controller = CarouselSliderControllerImpl();
    final key = GlobalKey<DotsIndicatorWithTimerState>();
    return SizedBox(
      width: double.infinity,
      height: height,
      child: Stack(
        children: [
          CarouselSlider(
            carouselController: controller,
            items: data.map(
              (e) {
                return Stack(
                  alignment: Alignment.bottomLeft,
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      e.image,
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
                            e.title,
                            style: Theme.of(context).textTheme.titleLarge,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            e.subtitle,
                            style: Theme.of(context).textTheme.titleMedium,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ).toList(),
            options: CarouselOptions(
              height: height,
              enlargeFactor: 1,
              viewportFraction: 1.0,
              onPageChanged: (index, reason) {
                if (reason == CarouselPageChangedReason.manual) {
                  DotsIndicatorWithTimerState state = key.currentState!;
                  state.updateIndex(index);
                }
              },
            ),
          ),
          if (showIndicator)
            Container(
              padding: const EdgeInsets.only(
                bottom: Dimens.tiny,
              ),
              alignment: Alignment.bottomCenter,
              child: DotsIndicatorWithTimer(
                key: key,
                itemCount: data.length,
                color: Colors.white,
                duration: Duration(seconds: delay),
                onTimerEnd: (index) {
                  controller.nextPage(
                    curve: Curves.easeInOut,
                    duration: const Duration(milliseconds: 500),
                  );
                },
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
