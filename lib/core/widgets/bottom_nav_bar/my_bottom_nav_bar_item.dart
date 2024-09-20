import 'package:flutter/material.dart';

import '../../configs.dart';

class MyBottomNavBarItem extends StatelessWidget {
  const MyBottomNavBarItem({
    super.key,
    required this.icon,
    this.isSelected = false,
  });

  final Widget icon;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.loose,
      alignment: Alignment.center,
      children: [
        const SizedBox(height: 48),
        icon,
      ],
    );
  }

  static List<Widget> icons = [];

  static List<BottomNavigationBarItem> createItems(
    int selectedIndex,
  ) {
    return List.generate(
      4,
      (index) => create(
          MyBottomNavBarItem(
            icon: icons[index],
            isSelected: index == selectedIndex,
          ),
          Config.listPageName[index]),
    );
  }

  static BottomNavigationBarItem create(Widget icon, String label) {
    return BottomNavigationBarItem(
      icon: icon,
      label: label,
    );
  }
}
