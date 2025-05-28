import '../../core/index.dart';
import '../../core/widgets/image_swiper/image_swiper.dart';

class HomeImageSwiper extends StatelessWidget {
  const HomeImageSwiper({super.key});

  @override
  Widget build(BuildContext context) {
    return ImageSwiper(
      data: [
        ImageData(
          image: Assets.images.cupcakeTop.path,
          title: Strings.kueTitle,
          subtitle: Strings.kueDescription,
        ),
        ImageData(
          image: Assets.images.chocolateCake.path,
          title: Strings.kueTitle2,
          subtitle: Strings.kueDescription2,
        ),
        ImageData(
          image: Assets.images.cakeWithFork.path,
          title: Strings.kueTitle3,
          subtitle: Strings.kueDescription3,
        ),
      ],
    );
  }
}
