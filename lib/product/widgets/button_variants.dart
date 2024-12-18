import 'package:flutter/material.dart';

class ButtonVariants extends StatefulWidget {
  const ButtonVariants({
    super.key,
    this.onTap,
  });

  final Function(int index)? onTap;

  @override
  State<ButtonVariants> createState() => ButtonVariantsState();
}

class ButtonVariantsState extends State<ButtonVariants> {
  int indexSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(
                indexSelected == 0 ? Colors.green : Colors.blue),
          ),
          onPressed: () => widget.onTap?.call(0),
          child: const Text('Variant 1'),
        ),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(
                indexSelected == 1 ? Colors.green : Colors.blue),
          ),
          onPressed: () => widget.onTap?.call(1),
          child: const Text('Variant 2'),
        )
      ],
    );
  }

  void selectedVariant(int index) {
    setState(() {
      indexSelected = index;
    });
  }
}
