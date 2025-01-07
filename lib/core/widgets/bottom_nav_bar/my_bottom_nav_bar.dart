import 'package:kekiku/core/widgets/bottom_nav_bar/bloc/bottom_nav_bar_cubit.dart';

import '../../index.dart';
import 'my_bottom_nav_bar_item.dart';

class MyBottomNavBar extends StatefulWidget {
  const MyBottomNavBar({
    super.key,
    this.onChanged,
  });

  final Function(int)? onChanged;

  @override
  State<MyBottomNavBar> createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final bottomNavBarCubit = context.read<BottomNavBarCubit>();
    return BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
      bloc: bottomNavBarCubit,
      builder: (context, state) {
        return ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          child: BottomNavigationBar(
            currentIndex: state.page,
            onTap: (index) {
              widget.onChanged?.call(index);
              bottomNavBarCubit.jumpToPage(index);
            },
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedLabelStyle: AppTextStyles.small,
            unselectedLabelStyle: AppTextStyles.small,
            selectedFontSize: 0.0,
            unselectedFontSize: 0.0,
            items: MyBottomNavBarItem.createItems(state.page),
          ),
        );
      },
    );
  }
}
