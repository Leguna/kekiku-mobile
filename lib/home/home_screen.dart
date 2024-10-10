import 'package:flutter/material.dart';
import 'package:kekiku/core/index.dart';
import 'package:kekiku/home/home_page.dart';

import '../core/widgets/bottom_nav_bar/bloc/bottom_nav_bar_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      bottomNavigationBar: const MyBottomNavBar(),
      body: BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
        builder: (context, state) {
          return PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: context.read<BottomNavBarCubit>().pageController,
            children: const [
              Center(child: Text('Track Page')),
              Center(child: Text('Cart Page')),
              HomePage(),
              Center(child: Text('Favorite Page')),
              Center(child: Text('Profile Page')),
            ],
          );
        },
      ),
    );
  }
}
