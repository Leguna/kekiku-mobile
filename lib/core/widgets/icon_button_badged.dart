import 'package:flutter/material.dart';

class IconButtonBadged extends IconButton {
  const IconButtonBadged({
    super.key,
    this.text = '',
    this.backgroundColor,
    this.textColor,
    required super.onPressed,
    required super.icon,
  });

  final String text;
  final Color? backgroundColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        super.build(context),
        if (text.isNotEmpty)
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: backgroundColor ?? Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              constraints: const BoxConstraints(
                minWidth: 16,
                minHeight: 16,
              ),
              child: Text(
                text,
                style: TextStyle(
                  color: textColor ?? Theme.of(context).colorScheme.onPrimary,
                  fontSize: 10,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    );
  }
}
