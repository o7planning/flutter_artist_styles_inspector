import 'package:flutter/material.dart';
import 'package:flutter_artist_commons_ui/flutter_artist_commons_ui.dart';
import 'package:flutter_artist_markdown_widget/flutter_artist_markdown_widget.dart';

class MarkdownDocViewDialog extends StatelessWidget {
  final String title;
  final String markdownContentUrl;

  const MarkdownDocViewDialog({
    super.key,
    required this.title,
    required this.markdownContentUrl,
  });

  static void show(
    BuildContext context, {
    required String title,
    required String markdownContentUrl,
  }) {
    showDialog(
      context: context,
      builder: (context) => MarkdownDocViewDialog(
        title: title,
        markdownContentUrl: markdownContentUrl,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size preferContentSize = Size(600, 400);

    return FaDialog(
      titleText: "Usage Guide: $title",
      iconData: Icons.menu_book_outlined,
      contentPadding: const EdgeInsets.all(12),
      preferredContentWidth: preferContentSize.width,
      preferredContentHeight: preferContentSize.height,
      content: _buildContent(context),
    );
  }

  Widget _buildContent(BuildContext context) {
    return FaMarkdownWidget.url(url: markdownContentUrl);
  }
}
