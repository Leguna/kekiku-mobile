import 'package:flutter/material.dart';
import 'package:kekiku/core/index.dart';
import 'package:kekiku/home/home_page.dart';

import '../core/widgets/bottom_nav_bar/bloc/bottom_nav_bar_cubit.dart';
import '../hamburger_menu/menu_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var bottomNavBarCubit = BottomNavBarCubit();
    return MyScaffold(
      bottomNavigationBar: MyBottomNavBar(bloc: bottomNavBarCubit),
      body: BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
        bloc: bottomNavBarCubit,
        builder: (context, state) {
          return PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: bottomNavBarCubit.pageController,
            children: const [
              Center(child: Text('Track Page')),
              Center(child: Text('Cart Page')),
              HomePage(),
              Center(child: Text('Favorite Page')),
              MenuScreen(showLeading: false),
            ],
          );
        },
      ),
    );
  }
}
