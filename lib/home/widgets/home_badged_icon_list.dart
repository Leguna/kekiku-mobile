import '../../core/index.dart';

class HomeBadgedIconList extends StatelessWidget {
  const HomeBadgedIconList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          const SizedBox(width: Dimens.tiny),
          IconButtonLabeled(
            label: 'Assurance',
            icon: Assets.svgs.home.svg(
                height: 32,
                colorFilter:
                    const ColorFilter.mode(Colors.blue, BlendMode.srcIn)),
          ),
          IconButtonLabeled(
            label: 'Health',
            icon: Assets.svgs.health.svg(
                height: 32,
                colorFilter:
                    const ColorFilter.mode(Colors.redAccent, BlendMode.srcIn)),
          ),
          IconButtonLabeled(
            label: 'Member',
            icon: Assets.svgs.card.svg(
                height: 32,
                colorFilter: const ColorFilter.mode(
                    Colors.amberAccent, BlendMode.srcIn)),
          ),   IconButtonLabeled(
            label: 'Community',
            icon: Assets.svgs.friend.svg(
                height: 32,
                colorFilter: const ColorFilter.mode(
                    Colors.grey, BlendMode.srcIn)),
          ),
          IconButtonLabeled(
            label: 'Zakat',
            icon: Assets.svgs.muslim.svg(
                height: 32,
                colorFilter: const ColorFilter.mode(
                    Colors.lightGreen, BlendMode.srcIn)),
          ),
          IconButtonLabeled(
            label: 'Hobby',
            icon: Assets.svgs.hobby.svg(
                height: 32,
                colorFilter: const ColorFilter.mode(
                    Colors.indigoAccent, BlendMode.srcIn)),
          ),
          IconButtonLabeled(
            label: 'Others',
            icon: Assets.svgs.all.svg(
                height: 32,
                colorFilter: const ColorFilter.mode(
                    Colors.greenAccent, BlendMode.srcIn)),
          ),
          const SizedBox(width: Dimens.tiny),
        ],
      ),
    );
  }
}
