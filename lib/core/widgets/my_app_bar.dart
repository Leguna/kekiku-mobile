import 'package:flutter/material.dart';

import '../index.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({
    super.key,
    this.title = '',
    this.leading,
    this.actions,
    this.isShowLeading = true,
    this.heightAdded = 20.0,
    this.size,
  });

  final double? size;
  final String title;
  final Widget? leading;
  final List<Widget>? actions;
  final bool isShowLeading;
  final double heightAdded;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppBar(
        surfaceTintColor: AppColors.primaryColorDark,
        foregroundColor: AppColors.primaryColorDark,
        backgroundColor: AppColors.primaryColorDark,
        leadingWidth: 80.0,
        toolbarHeight: kToolbarHeight + heightAdded,
        titleSpacing: 0.0,
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            title,
            softWrap: true,
            style: AppTextStyles.appBarTitle,
            textAlign: TextAlign.center,
            overflow: TextOverflow.visible,
          ),
        ),
        leading: Row(
          children: [
            if (isShowLeading) ...[
              IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  size: 20.0,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ] else ...[
              const SizedBox(width: 30.0),
            ],
          ],
        ),
        actions: actions,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
        kToolbarHeight + heightAdded,
      );
}
