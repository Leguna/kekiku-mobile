import 'package:flutter/material.dart';

import '../../core/index.dart';
import '../../core/widgets/image_swiper/image_swiper.dart';

class HomeImageSwiper extends StatelessWidget {
  const HomeImageSwiper({super.key});

  @override
  Widget build(BuildContext context) {
    return ImageSwiper(
      height: 180,
      delay: 3,
      data: [
        ImageData(
          image: Assets.images.kue.path,
          title: Strings.kueTitle,
          subtitle: Strings.kueDescription,
        ),
        ImageData(
          image: Assets.images.kue2.path,
          title: Strings.kueTitle2,
          subtitle: Strings.kueDescription2,
        ),
      ],
    );
  }
}
