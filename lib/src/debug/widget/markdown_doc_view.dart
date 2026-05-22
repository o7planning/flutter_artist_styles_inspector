import 'package:flutter/cupertino.dart' as cupertino;
import 'package:flutter/material.dart';
import 'package:flutter_artist_core/flutter_artist_core.dart';
import 'package:flutter_artist_styles/flutter_artist_styles.dart';
import 'package:markdown_widget/markdown_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class MarkdownDocView extends StatelessWidget {
  final String markdownContentUrl;

  const MarkdownDocView({super.key, required this.markdownContentUrl});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: FaUrlTextCache.instance.getText(url: markdownContentUrl),
      builder: (context, snapshot) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: _buildContent(context, snapshot),
        );
      },
    );
  }

  Widget _buildContent(BuildContext context, AsyncSnapshot<String> snapshot) {
    /// Loading
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(
        key: ValueKey('loading'),
        child: cupertino.CupertinoActivityIndicator(),
      );
    }

    /// Error
    if (snapshot.hasError) {
      return Center(
        key: const ValueKey('error'),
        child: SelectableText(
          "Guide not available yet.\n${snapshot.error}",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: context.faColors.ink.tertiaryQuiet,
            fontSize: 12,
          ),
        ),
      );
    }

    final colors = context.faColors;

    final markdown = snapshot.data ?? "";

    final config = MarkdownConfig(
      configs: [
        /// Paragraph
        PConfig(
          textStyle: TextStyle(
            fontSize: 13,
            height: 1.5,
            color: colors.ink.primary,
          ),
        ),

        /// H1
        H1Config(
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: colors.ink.primary,
          ),
        ),

        /// H2
        H2Config(
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: colors.ink.primary,
          ),
        ),

        /// H3
        H3Config(
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: colors.ink.primary,
          ),
        ),

        /// Inline code
        CodeConfig(
          style: TextStyle(
            color: colors.ink.highlight,
            fontSize: 12,
            fontFamily: 'monospace',
            fontWeight: FontWeight.bold,
            backgroundColor: colors.surface.muted,
          ),
        ),

        /// Code block
        PreConfig(
          textStyle: TextStyle(
            fontSize: 12,
            fontFamily: 'monospace',
            color: colors.ink.primary,
            height: 1.4,
          ),
          decoration: BoxDecoration(
            color: colors.surface.muted,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: colors.divider.subtle),
          ),
          padding: const EdgeInsets.all(12),
        ),

        /// Blockquote
        BlockquoteConfig(
          sideColor: colors.ink.danger,
          textColor: colors.ink.primary,
          sideWith: 4,
          padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
          margin: const EdgeInsets.symmetric(vertical: 12),
        ),

        /// Link
        LinkConfig(
          style: TextStyle(
            color: colors.ink.highlight,
            decoration: TextDecoration.underline,
          ),
          onTap: (url) async {
            final uri = Uri.tryParse(url);

            if (uri != null) {
              await launchUrl(uri);
            }
          },
        ),

        /// List
        ListConfig(marginBottom: 8, marginLeft: 28),

        /// Horizontal rule
        HrConfig(color: colors.divider.subtle, height: 1),

        /// Table
        TableConfig(
          border: TableBorder.all(color: colors.divider.subtle),
          headerRowDecoration: BoxDecoration(color: colors.surface.subtle),
          bodyRowDecoration: BoxDecoration(color: colors.surface.standard),
          headerStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: colors.ink.primary,
            fontSize: 13,
          ),
          bodyStyle: TextStyle(color: colors.ink.primary, fontSize: 13),
          headPadding: const EdgeInsets.all(8),
          bodyPadding: const EdgeInsets.all(8),

          wrapper: (child) {
            return SizedBox(width: double.infinity, child: child);
          },
        ),
      ],
    );
    final generator = MarkdownGenerator();
    final widgets = generator.buildWidgets(markdown, config: config);
    return Container(
      key: const ValueKey('markdown'),
      color: colors.surface.standard,
      child: SelectionArea(
        child: ListView(padding: const EdgeInsets.all(8), children: widgets),
      ),
    );
  }
}
