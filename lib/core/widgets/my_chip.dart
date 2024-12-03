import 'package:flutter/material.dart';

class MyChip extends StatelessWidget {
  const MyChip({
    super.key,
    required this.data,
    this.onTap,
  });

  final ChipData data;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(64),
      onTap: onTap,
      child: Ink(
        decoration: BoxDecoration(
          color: data.isEnable
              ? Theme.of(context).primaryColorDark
              : Theme.of(context).primaryColorDark.withOpacity(0.5),
          borderRadius: BorderRadius.circular(64),
          border: Border.all(
            color: data.isSelected
                ? Theme.of(context).colorScheme.onSecondary.withOpacity(0.3)
                : Theme.of(context).primaryColorDark,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            data.leading ?? const SizedBox(),
            data.leading != null ? const SizedBox(width: 4) : const SizedBox(),
            Text(
              data.label,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
            data.trailing != null ? const SizedBox(width: 4) : const SizedBox(),
            data.trailing ?? const SizedBox(),
          ],
        ),
      ),
    );
  }
}

class ChipData {
  final String label;
  final bool isSelected;
  final bool isEnable;
  final Widget? leading;
  final Widget? trailing;

  ChipData({
    required this.label,
    this.isSelected = false,
    this.isEnable = true,
    this.leading,
    this.trailing,
  });
}
