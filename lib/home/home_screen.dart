import 'package:flutter/material.dart';
import 'package:kekiku/core/index.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
        body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              Strings.homeTitle,
              style: AppTextStyles.titleHome,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    Strings.categoryTitle,
                  ),
                ),
              ),
              // See all
            ],
          ),
          // List of categories
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.charcoalBlue,
                    borderRadius: BorderRadius.circular(64),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    Strings.all,
                  ),
                ),
              ),
              // Search
            ],
          ),
          const SizedBox(height: 16),
        ],
      ),
    ));
  }
}
