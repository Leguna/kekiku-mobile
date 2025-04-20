import 'package:flutter/material.dart';

class IconButtonBadged extends IconButton {
  const IconButtonBadged({
    required super.icon,
    super.key,
    super.padding,
    this.badgeText = '',
    this.backgroundColor,
    this.textColor,
    super.onPressed,
    super.disabledColor = Colors.grey,
    super.visualDensity,
  });

  final String badgeText;
  final Color? backgroundColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        super.build(context),
        if (badgeText.isNotEmpty)
          Positioned(
            right: 2,
            top: 2,
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
                badgeText,
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
