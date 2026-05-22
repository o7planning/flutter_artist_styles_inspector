import 'package:flutter/material.dart';
import 'package:flutter_artist_styles/flutter_artist_styles.dart';

import '_base_tab_content_state.dart';

/// Gallery layout panel dedicated to rendering, testing, and inspecting
/// global volumetric depth elevation layers and dynamic alpha opacity shadow tokens.
class ShadowTabContent extends FaColorsBaseTabContent {
  const ShadowTabContent({super.key, required super.langCode})
    : super(tabId: "shadow");

  @override
  State<ShadowTabContent> createState() => _ShadowTabContentState();
}

class _ShadowTabContentState
    extends FaColorsBaseTabContentState<ShadowTabContent> {
  @override
  List<MapEntry<String, FaColor>> getColorCodeData() {
    // Dynamic self-reflection layout parsing yields a clean single-line registry mapping
    return context.faColors.shadow.allTokens
        .map((color) => MapEntry(color.tokenName, color))
        .toList();
  }

  @override
  String getDescription() {
    return "Shadow Namespace manages volumetric interaction layer elevations and object shadows. "
        "These tokens represent multi-tiered structural depths (subtle, standard, strong) "
        "and bypass the standard blending pipeline to preserve precise opacity channels.";
  }

  @override
  Widget buildGallery(BuildContext context) {
    final s = context.faColors.shadow;

    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.zero,
      children: [
        buildGroup(context, "Elevation Depth Tiers", [
          _shadowPreview(
            context,
            label: "Subtle Shadow",
            color: s.subtle,
            desc:
                "Faint low-density shadow designed for nested card layers or chip popovers.",
            tokenShortKey: "subtle",
            blurRadius: 4.0,
          ),
          const SizedBox(height: 16),
          _shadowPreview(
            context,
            label: "Standard Shadow",
            color: s.standard,
            desc:
                "Default layout card, settings panel, or standalone AppBar boundary depth.",
            tokenShortKey: "standard",
            blurRadius: 8.0,
          ),
          const SizedBox(height: 16),
          _shadowPreview(
            context,
            label: "Strong Shadow",
            color: s.strong,
            desc:
                "Heavy maximum-density volumetric shadow reserved for high-priority floating dialog surfaces.",
            tokenShortKey: "strong",
            blurRadius: 16.0,
          ),
        ]),
      ],
    );
  }

  /// Compiles a realistic elevated panel simulation block linked to the code blueprint console.
  Widget _shadowPreview(
    BuildContext context, {
    required String label,
    required Color color,
    required String desc,
    required String tokenShortKey,
    required double blurRadius,
  }) {
    final code =
        "Container(\n"
        "  decoration: BoxDecoration(\n"
        "    color: context.faColors.surface.standard,\n"
        "    borderRadius: BorderRadius.circular(8),\n"
        "    boxShadow: [\n"
        "      BoxShadow(\n"
        "        color: context.faColors.shadow.$tokenShortKey,\n"
        "        blurRadius: $blurRadius,\n"
        "        offset: const Offset(0, 4),\n"
        "      )\n"
        "    ],\n"
        "  ),\n"
        "  child: const Text('Sample Content'),\n"
        ");";

    return ink(
      context,
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            decoration: BoxDecoration(
              color: context.faColors.surface.standard,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: context.faColors.stroke.subtle),
              boxShadow: [
                BoxShadow(
                  color: color,
                  blurRadius: blurRadius,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Text(
              label,
              style: TextStyle(
                color: context.faColors.ink.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            desc,
            style: TextStyle(
              color: context.faColors.ink.secondary,
              fontSize: 12,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
      () => updateCode(code),
    );
  }
}
