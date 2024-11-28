import 'package:flutter/material.dart';

class MyDropdownFormField extends StatelessWidget {
  const MyDropdownFormField({
    super.key,
    this.value,
    this.decoration = const InputDecoration(),
    required this.items,
    this.onChanged,
  });

  final dynamic value;
  final InputDecoration decoration;
  final List<DropdownMenuItem> items;
  final Function(dynamic)? onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: value,
      dropdownColor: Theme.of(context).scaffoldBackgroundColor,
      decoration: decoration,
      isDense: true,
      padding: EdgeInsets.zero,
      items: items,
      onChanged: onChanged,
    );
  }
}
