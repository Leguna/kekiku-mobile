import 'package:flutter/material.dart';

import 'my_app_bar.dart';
import 'my_scaffold.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyScaffold(
      appBar: MyAppBar(title: 'No Page Found'),
      body: Center(
        child: Column(
          children: [
            // Icon
            Icon(Icons.error),
            Text('404'),
          ],
        ),
      ),
    );
  }
}
