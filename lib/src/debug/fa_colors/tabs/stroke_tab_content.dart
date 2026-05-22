import 'package:flutter/material.dart';
import 'package:flutter_artist_styles/flutter_artist_styles.dart';

import '_base_tab_content_state.dart';

/// Gallery layout panel dedicated to rendering, testing, and inspecting
/// global application border strokes, perimeter outlines, and structural boundaries.
class StrokeTabContent extends FaColorsBaseTabContent {
  const StrokeTabContent({super.key, required super.langCode})
    : super(tabId: "stroke");

  @override
  State<StrokeTabContent> createState() => _StrokeTabContentState();
}

class _StrokeTabContentState
    extends FaColorsBaseTabContentState<StrokeTabContent> {
  @override
  List<MapEntry<String, FaColor>> getColorCodeData() {
    // Dynamic self-reflection layout parsing yields a clean single-line registry mapping
    return context.faColors.stroke.allTokens
        .map((color) => MapEntry(color.tokenName, color))
        .toList();
  }

  @override
  String getDescription() {
    return "Stroke tokens define the borders and structural outlines of the UI. "
        "In the Surface-Ink-Stroke hierarchy, they provide subtle separation between "
        "different content areas without adding excessive visual weight.";
  }

  @override
  Widget buildGallery(BuildContext context) {
    final s = context.faColors.stroke;

    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.zero,
      children: [
        buildGroup(context, "Border Variations", [
          _strokePreview(
            context,
            label: "Subtle Stroke",
            color: s.subtle,
            desc: "Used for very light separation, like internal list items.",
            tokenShortKey: "subtle",
          ),
          const SizedBox(height: 16),
          _strokePreview(
            context,
            label: "Medium Stroke",
            color: s.medium,
            desc:
                "The default border for cards, containers, and general outlines.",
            tokenShortKey: "medium",
          ),
          const SizedBox(height: 16),
          _strokePreview(
            context,
            label: "Strong Stroke",
            color: s.strong,
            desc:
                "Used for high-contrast borders or to define major layout boundaries.",
            tokenShortKey: "strong",
          ),
        ]),
      ],
    );
  }

  /// Compiles a realistic structural border container specimen mapped to the interactive console.
  Widget _strokePreview(
    BuildContext context, {
    required String label,
    required Color color,
    required String desc,
    required String tokenShortKey,
  }) {
    // Resolved the legacy string splitting constraints by passing the accurate token variable key directly
    final code =
        "Container(\n"
        "  decoration: BoxDecoration(\n"
        "    border: Border.all(\n"
        "      color: context.faColors.stroke.$tokenShortKey,\n"
        "      width: 1.0,\n"
        "    ),\n"
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
              border: Border.all(color: color, width: 1.5),
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
