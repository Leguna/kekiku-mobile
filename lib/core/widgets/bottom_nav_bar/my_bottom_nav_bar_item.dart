import 'package:flutter/material.dart';

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
        icon,
      ],
    );
  }

  static List<Map<String, Widget>> bottomNavBarItemsWithIcons = [
    {'Track': const Icon(Icons.track_changes)},
    {'Cart': const Icon(Icons.shopping_cart)},
    {'Home': const Icon(Icons.home)},
    {'Favorites': const Icon(Icons.favorite)},
    {'Profile': const Icon(Icons.person)},
  ];

  static List<BottomNavigationBarItem> createItems(
    int selectedIndex,
  ) {
    return List.generate(
      bottomNavBarItemsWithIcons.length,
      (index) => create(
        MyBottomNavBarItem(
          icon: bottomNavBarItemsWithIcons[index].values.first,
          isSelected: index == selectedIndex,
        ),
        bottomNavBarItemsWithIcons[index].keys.first,
      ),
    );
  }

  static BottomNavigationBarItem create(Widget icon, String label) {
    return BottomNavigationBarItem(
      icon: icon,
      label: label,
    );
  }
}
