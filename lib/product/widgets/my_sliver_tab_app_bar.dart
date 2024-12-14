import 'package:flutter/material.dart';

class MySliverTabAppBar extends StatelessWidget {
  const MySliverTabAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
    // return SliverAppBar(
    //   leadingWidth: 0,
    //   automaticallyImplyLeading: false,
    //   floating: true,
    //   bottom: const PreferredSize(
    //     preferredSize: Size.fromHeight(0),
    //     child: SizedBox(height: 0),
    //   ),
    //   flexibleSpace: FlexibleSpaceBar(
    //     title: DefaultTabController(
    //       length: 2,
    //       child: TabBar(
    //         onTap: (index) {
    //           if (index == 0) {
    //             mainController.animateTo(
    //               _getDescriptionOffset(descriptionKey) ?? 0,
    //               duration: const Duration(milliseconds: 500),
    //               curve: Curves.ease,
    //             );
    //           }
    //           if (index == 1) {
    //             mainController.animateTo(
    //               _getDescriptionOffset(reviewKey) ?? 0,
    //               duration: const Duration(milliseconds: 500),
    //               curve: Curves.ease,
    //             );
    //           }
    //         },
    //         padding: EdgeInsets.zero,
    //         indicatorSize: TabBarIndicatorSize.tab,
    //         tabs: const [
    //           Tab(
    //             text: Strings.description,
    //           ),
    //           Tab(
    //             text: Strings.reviews,
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
