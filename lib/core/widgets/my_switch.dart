import 'package:flutter/material.dart';


class MySwitch extends StatelessWidget {
  const MySwitch({
    super.key,
    this.onChanged,
    this.value = false,
  });

  final Function(bool)? onChanged;
  final bool value;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged?.call(!value);
      },
    );
  }
}
