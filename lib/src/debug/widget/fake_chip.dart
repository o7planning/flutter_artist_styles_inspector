import 'package:flutter/material.dart';

class FakeChip extends StatelessWidget {
  final Widget label;
  final Widget? avatar;
  final EdgeInsetsGeometry padding;
  final Color? backgroundColor;
  final Color? borderColor;
  final double radius;

  const FakeChip({
    super.key,
    required this.label,
    this.avatar,
    this.padding = const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
    this.backgroundColor,
    this.borderColor,
    this.radius = 16,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor ?? theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(
          color: borderColor ?? theme.colorScheme.outlineVariant,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (avatar != null) ...[avatar!, const SizedBox(width: 6)],
          Flexible(child: label),
        ],
      ),
    );
  }
}
