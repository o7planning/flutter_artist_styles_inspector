import 'package:flutter/material.dart';
import 'package:flutter_artist_styles/flutter_artist_styles.dart';

import '_base_tab_content_state.dart';

/// Gallery layout panel dedicated to rendering, testing, and inspecting
/// structural separation lines and layout dividing borders.
class DividerTabContent extends FaColorsBaseTabContent {
  const DividerTabContent({super.key, required super.langCode})
    : super(tabId: "divider");

  @override
  State<DividerTabContent> createState() => _DividerTabContentState();
}

class _DividerTabContentState
    extends FaColorsBaseTabContentState<DividerTabContent> {
  @override
  List<MapEntry<String, FaColor>> getColorCodeData() {
    // Dynamic self-reflection layout parsing yields a clean single-line registry mapping
    return context.faColors.divider.allTokens
        .map((color) => MapEntry(color.tokenName, color))
        .toList();
  }

  @override
  String getDescription() {
    return "Divider Namespace contains structural separators. "
        "Subtle dividers are for internal content, while Strong dividers define major sections break.";
  }

  @override
  Widget buildGallery(BuildContext context) {
    final div = context.faColors.divider;

    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.zero,
      children: [
        buildGroup(context, "Dividers in Context", [
          _wrapDividerTrigger(
            context,
            tokenShortKey: "subtle",
            thickness: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Section A (Click to inspect subtle divider)",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: context.faColors.ink.primary,
                  ),
                ),
                Divider(color: div.subtle, thickness: 1),
                Text(
                  "Section B (Sub-item boundary layout block)",
                  style: TextStyle(
                    fontSize: 11,
                    color: context.faColors.ink.secondary,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          _wrapDividerTrigger(
            context,
            tokenShortKey: "strong",
            thickness: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                _barHeader(context, "Major Section Break Layout Indicator"),
                Divider(color: div.strong, thickness: 2, height: 1),
              ],
            ),
          ),
        ]),
      ],
    );
  }

  /// Wraps any section layout to bind it into the interactive code output simulation channel.
  Widget _wrapDividerTrigger(
    BuildContext context, {
    required String tokenShortKey,
    required double thickness,
    required Widget child,
  }) {
    final code =
        "// Structural separating contour line alignment\n"
        "Divider(\n"
        "  color: context.faColors.divider.$tokenShortKey,\n"
        "  thickness: $thickness,\n"
        ");";

    return InkWell(
      onTap: () => updateCode(code),
      borderRadius: BorderRadius.circular(6),
      child: Padding(padding: const EdgeInsets.all(6.0), child: child),
    );
  }

  Widget _barHeader(BuildContext context, String title) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      color: context.faColors.bar.standard,
      child: Text(
        title,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.bold,
          color: context.faColors.ink.primary,
        ),
      ),
    );
  }
}
