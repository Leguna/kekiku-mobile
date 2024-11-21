import 'package:flutter/material.dart';
import 'package:kekiku/core/widgets/bottom_nav_bar/bloc/bottom_nav_bar_cubit.dart';

import '../../index.dart';
import 'my_bottom_nav_bar_item.dart';

class MyBottomNavBar extends StatelessWidget {
  const MyBottomNavBar({
    super.key,
    required this.bloc,
  });

  final BottomNavBarCubit bloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
      bloc: bloc,
      builder: (context, state) {
        return ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          child: BottomNavigationBar(
            currentIndex: state.page,
            onTap: (index) {
              bloc.jumpToPage(index);
            },
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedLabelStyle: AppTextStyles.micro,
            unselectedLabelStyle: AppTextStyles.micro,
            selectedFontSize: 0.0,
            unselectedFontSize: 0.0,
            items: MyBottomNavBarItem.createItems(state.page),
          ),
        );
      },
    );
  }
}
