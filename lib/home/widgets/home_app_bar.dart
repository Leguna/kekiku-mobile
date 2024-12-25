import '../../core/index.dart';
import '../../transaction/widgets/filter_bar.dart';
import 'fake_search_bar.dart';

class HomeAppBar extends AppBar {
  HomeAppBar({
    super.key,
    super.bottom,
    super.title = const FakeSearchBar(),
    super.leading = const SizedBox(width: 16),
  });

  Widget build(BuildContext context) {
    return AppBar(
      title: const FakeSearchBar(),
      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(48),
        child: SizedBox(
          height: 48,
          child: FilterBar(),
        ),
      ),
      leading: const SizedBox(width: 16),
      leadingWidth: 16,
      titleSpacing: 0,
      actions: [
        IconButtonBadged(
          onPressed: () {},
          icon: const Icon(Icons.notifications_none),
        ),
        IconButtonBadged(
          onPressed: () {},
          icon: const Icon(Icons.shopping_cart_outlined),
        ),
      ],
    );
  }
}
