import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_artist_styles/flutter_artist_styles.dart';

import 'dialog/code_example_dialog.dart';

Widget buildAccordionGroup(
  BuildContext context, {
  required String title,
  required IconData icon,
  required List<Widget> children,
  String? exampleCode,
}) {
  return Card(
    clipBehavior: Clip.antiAlias,
    margin: const EdgeInsets.only(bottom: 12),
    child: Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      // ✅ IMPORTANT: Use Material.
      child: Material(
        color: Colors.transparent,
        child: ExpansionTile(
          initiallyExpanded: true,
          leading: Icon(icon, color: context.faColors.ink.primary),
          title: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          trailing: exampleCode != null
              ? IconButton(
                  icon: const Icon(Icons.code, size: 20),
                  tooltip: "Show Usage Example",
                  onPressed: () {
                    CodeExampleDialog.openDialog(
                      context,
                      title: title,
                      code: exampleCode,
                    );
                  },
                )
              : null,
          children: children,
        ),
      ),
    ),
  );
}

Widget buildMetricRow(
  BuildContext context, {
  required String label,
  required String value,
  double? visualSize,
}) {
  return ListTile(
    title: Text(
      label,
      style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
    ),
    subtitle: visualSize != null
        ? Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: UnconstrainedBox(
              alignment: Alignment.centerLeft,
              child: Container(
                height: 8,
                width: visualSize * 2,
                decoration: BoxDecoration(
                  color: context.faColors.surface.subtle,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          )
        : null,
    trailing: Text(
      value,
      style: TextStyle(
        color: context.faColors.ink.secondary,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Widget buildColorRow(
  BuildContext context, {
  required String label,
  required Color color,
}) {
  return ListTile(
    title: Text(label, style: const TextStyle(fontSize: 13)),
    trailing: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '#${color.toARGB32().toRadixString(16).toUpperCase()}',
          style: TextStyle(color: context.faColors.ink.secondary, fontSize: 12),
        ),
        const SizedBox(width: 12),
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            border: Border.all(color: context.faColors.stroke.subtle),
          ),
        ),
      ],
    ),
  );
}

/// Tiêu đề nhóm nhỏ bên trong Others
Widget buildSubGroupTitle(BuildContext context, String title) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
    child: Row(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.bold,
            color: context.faColors.ink.primary,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(child: Divider(color: context.faColors.divider.subtle)),
      ],
    ),
  );
}

Widget buildRadiusPreview(
  BuildContext context, {
  required String label,
  required double radius,
}) {
  return ListTile(
    title: Text(label, style: const TextStyle(fontSize: 13)),
    trailing: Container(
      width: 48,
      height: 32,
      decoration: BoxDecoration(
        color: context.faColors.surface.emphasized,
        border: Border.all(color: context.faColors.stroke.subtle, width: 1.5),
        borderRadius: BorderRadius.circular(radius),
      ),
    ),
  );
}

Widget buildHexCell(BuildContext context, String hex) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 4),
    child: Row(
      children: [
        Expanded(
          child: Text(
            hex,
            style: const TextStyle(fontFamily: 'monospace', fontSize: 12),
          ),
        ),
        InkWell(
          borderRadius: BorderRadius.circular(4),
          onTap: () {
            Clipboard.setData(ClipboardData(text: hex));
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Copied $hex to clipboard!'),
                duration: const Duration(seconds: 1),
                behavior: SnackBarBehavior.floating,
                width: 250,
              ),
            );
          },
          child: Padding(
            padding: EdgeInsets.all(4.0),
            child: Icon(
              Icons.copy_rounded,
              size: 14,
              color: context.faColors.action.ink.primary,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget buildColorPreview(Color color) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
    decoration: BoxDecoration(
      color: color,
      border: Border.all(color: Colors.grey.withValues(alpha: 0.3)),
      borderRadius: BorderRadius.circular(4),
    ),
  );
}
