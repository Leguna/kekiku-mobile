import 'package:flutter/material.dart';

import 'my_bottom_nav_bar_item.dart';

class MyBottomNavBar extends StatelessWidget {
  const MyBottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20.0),
        topRight: Radius.circular(20.0),
      ),
      child: BottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          // Jump to page
        },
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        selectedFontSize: 0.0,
        unselectedFontSize: 0.0,
        items: MyBottomNavBarItem.createItems(
          0,
        ),
      ),
    );
  }
}
