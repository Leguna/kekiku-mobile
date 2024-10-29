import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({
    super.key,
    this.actions = const [],
    this.bottom,
  });

  final List<Widget> actions;
  final PreferredSizeWidget? bottom;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppBar(
        actions: actions,
        bottom: bottom ??
            PreferredSize(
              preferredSize: const Size.fromHeight(0.0),
              child: Container(
                width: double.infinity,
                height: 0.5,
                color: Colors.grey,
              ),
            ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
