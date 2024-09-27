import 'package:flutter/material.dart';

class MyBottomNavBarItem extends StatelessWidget {
  const MyBottomNavBarItem({
    super.key,
    required this.icon,
    this.isSelected = false,
    this.badgeCount = 0,
  });

  final Widget icon;
  final bool isSelected;
  final int badgeCount;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.loose,
      alignment: Alignment.center,
      children: [
        icon,
        if (badgeCount > 0)
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              padding: const EdgeInsets.all(0),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              constraints: const BoxConstraints(
                minWidth: 16,
                minHeight: 16,
              ),
              child: Text(
                badgeCount.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
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
          icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: bottomNavBarItemsWithIcons[index].values.first),
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
