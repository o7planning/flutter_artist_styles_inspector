import 'package:flutter/material.dart';
import 'package:flutter_artist_commons_ui/flutter_artist_commons_ui.dart';

class CodeExampleDialog extends StatelessWidget {
  final String title;
  final String code;

  const CodeExampleDialog({super.key, required this.title, required this.code});

  static void openDialog(
    BuildContext context, {
    required String title,
    required String code,
  }) {
    showDialog(
      context: context,
      builder: (context) => CodeExampleDialog(title: title, code: code),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size preferContentSize = Size(560, 340);

    return FaDialog(
      titleText: "Usage: $title",
      iconData: Icons.palette_outlined,
      contentPadding: EdgeInsets.all(5),
      preferredContentWidth: preferContentSize.width,
      preferredContentHeight: preferContentSize.height,
      content: _buildContent(context),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          "How to use this token:",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Expanded(
          child: SingleChildScrollView(
            child: SelectableText(
              code,
              style: const TextStyle(
                fontFamily: 'monospace',
                fontSize: 13,
                color: Colors.blueGrey,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
