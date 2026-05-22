import 'package:flutter/material.dart';
import 'package:flutter_artist_styles/flutter_artist_styles.dart';

import '_base_tab_content_state.dart';

/// Gallery layout panel dedicated to rendering, testing, and inspecting
/// global typography text hierarchies and icon content ink tokens.
class InkTabContent extends FaColorsBaseTabContent {
  const InkTabContent({super.key, required super.langCode})
    : super(tabId: "ink");

  @override
  State<InkTabContent> createState() => _InkTabContentState();
}

class _InkTabContentState extends FaColorsBaseTabContentState<InkTabContent> {
  @override
  List<MapEntry<String, FaColor>> getColorCodeData() {
    // Dynamic self-reflection layout parsing yields a clean single-line registry mapping
    return context.faColors.ink.allTokens
        .map((color) => MapEntry(color.tokenName, color))
        .toList();
  }

  @override
  String getDescription() {
    return "Typography tokens are designed for large surface areas. "
        "If you are building a button, **STOP!** Use context.faColors.action.ink instead. "
        "Typography tokens ensure readability on surface.ground and surface.container";
  }

  @override
  Widget buildGallery(BuildContext context) {
    final inkTokens = context.faColors.ink;

    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(0),
      children: [
        // =====================================================================
        // 1. STANDARD TYPOGRAPHY HIERARCHY
        // =====================================================================
        buildGroup(context, "Content Hierarchy", [
          _textSample(
            context,
            title: "Primary Text",
            color: inkTokens.primary,
            desc: "Main content and titles.",
            tokenShortKey: "primary",
            isBold: true,
            fontSize: 16,
          ),
          _textSample(
            context,
            title: "Secondary Text",
            color: inkTokens.secondary,
            desc: "Supporting information and descriptions.",
            tokenShortKey: "secondary",
            fontSize: 14,
          ),
          _textSample(
            context,
            title: "Label Text",
            color: inkTokens.label,
            desc: "Field labels, headers, and small metadata.",
            tokenShortKey: "label",
            fontSize: 12,
            isUppercase: true,
          ),
          _textSample(
            context,
            title: "Muted Neutral Text",
            color: inkTokens.tertiaryQuiet,
            desc: "Disabled states or very low priority hints.",
            tokenShortKey: "tertiaryQuiet",
            fontSize: 11,
            isItalic: true,
          ),
        ]),
        const SizedBox(height: 24),

        // =====================================================================
        // 2. SEMANTIC SYSTEM FEEDBACK INKS
        // =====================================================================
        buildGroup(context, "Semantic Status Text", [
          _textSample(
            context,
            title: "Success Message",
            color: inkTokens.success,
            desc: "Operation completed successfully.",
            tokenShortKey: "success",
            fontSize: 13,
          ),
          _textSample(
            context,
            title: "Warning Message",
            color: inkTokens.warning,
            desc: "Attention or non-blocking synchronization required.",
            tokenShortKey: "warning",
            fontSize: 13,
          ),
          _textSample(
            context,
            title: "Danger/Error Message",
            color: inkTokens.danger,
            desc: "Critical system fault or broken constraints.",
            tokenShortKey: "danger",
            fontSize: 13,
          ),
        ]),
      ],
    );
  }

  /// Compiles an interactive typography text specimen block linked to the code inspector channel.
  Widget _textSample(
    BuildContext context, {
    required String title,
    required Color color,
    required String desc,
    required String tokenShortKey,
    double fontSize = 14,
    bool isBold = false,
    bool isItalic = false,
    bool isUppercase = false,
  }) {
    // Solved the historical text string parsing break by explicitly forwarding the token identifier key
    final code =
        "Text(\n"
        "  'Your Text Here',\n"
        "  style: TextStyle(\n"
        "    color: context.faColors.ink.$tokenShortKey,\n"
        "    fontSize: $fontSize,\n"
        "    fontWeight: ${isBold ? 'FontWeight.bold' : 'FontWeight.normal'},\n"
        "    fontStyle: ${isItalic ? 'FontStyle.italic' : 'FontStyle.normal'},\n"
        "  ),\n"
        ");";

    return InkWell(
      onTap: () => updateCode(code),
      borderRadius: BorderRadius.circular(4),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              isUppercase ? title.toUpperCase() : title,
              style: TextStyle(
                color: color,
                fontSize: fontSize,
                fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
                fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              desc,
              style: TextStyle(
                color: context.faColors.ink.tertiaryQuiet,
                fontSize: 11,
              ),
            ),
            const SizedBox(height: 6),
            Divider(
              color: context.faColors.divider.subtle,
              thickness: 0.5,
              height: 1,
            ),
          ],
        ),
      ),
    );
  }
}
