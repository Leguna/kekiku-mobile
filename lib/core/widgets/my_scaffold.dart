import 'package:flutter/material.dart';

import '../index.dart';

class MyScaffold extends StatelessWidget {
  const MyScaffold({
    super.key,
    this.isMiddle = true,
    required this.body,
    this.appBar,
    this.bottomNavigationBar,
    this.bottomSheet,
  });

  final bool isMiddle;
  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;
  final Widget? bottomSheet;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: AppColors.primaryColorDark,
          width: double.infinity,
          height: double.infinity,
        ),
        Scaffold(
          appBar: appBar,
          backgroundColor: Colors.transparent,
          bottomSheet: bottomSheet,
          body: SafeArea(
            child: Stack(children: [
              body,
            ]),
          ),
          bottomNavigationBar: bottomNavigationBar,
        ),
      ],
    );
  }
}
