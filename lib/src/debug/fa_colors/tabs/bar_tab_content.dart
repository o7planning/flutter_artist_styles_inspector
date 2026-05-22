import 'package:flutter/material.dart';
import 'package:flutter_artist_styles/flutter_artist_styles.dart';

import '_base_tab_content_state.dart';

/// Gallery layout panel dedicated to rendering, testing, and inspecting
/// structural appbars, headers, and bottom navigation boundary tokens.
class BarTabContent extends FaColorsBaseTabContent {
  const BarTabContent({super.key, required super.langCode})
    : super(tabId: "bar");

  @override
  State<BarTabContent> createState() => _FaTabContentState();
}

class _FaTabContentState extends FaColorsBaseTabContentState<BarTabContent> {
  @override
  List<MapEntry<String, FaColor>> getColorCodeData() {
    // Dynamic self-reflection layout parsing yields a clean single-line registry mapping
    return context.faColors.bar.allTokens
        .map((color) => MapEntry(color.tokenName, color))
        .toList();
  }

  @override
  String getDescription() {
    return "Bar Namespace manages the structural layers of the UI. "
        "Bars provide consistent backgrounds for navigation elements.";
  }

  @override
  Widget buildGallery(BuildContext context) {
    final b = context.faColors.bar;

    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(0),
      children: [
        buildGroup(context, "Navigation & Action Bars", [
          _barPreview(context, "Subtle Bar", b.subtle, "subtle"),
          _barPreview(context, "Standard Bar", b.standard, "standard"),
          _barPreview(context, "Strong Bar", b.strong, "strong"),
        ]),
      ],
    );
  }

  /// Compiles a realistic application header component mock tracking exact structural backgrounds.
  Widget _barPreview(
    BuildContext context,
    String label,
    FaColor color,
    String tokenShortKey,
  ) {
    final code =
        "// Use for AppBars, BottomBars or Footers\n"
        "Container(\n"
        "  height: 40,\n"
        "  color: context.faColors.bar.$tokenShortKey,\n"
        "  child: const Center(child: Text('$label')),\n"
        ");";

    return InkWell(
      onTap: () => updateCode(code),
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: color,
          border: Border.all(
            color: context.faColors.divider.strong,
            width: 0.5,
          ),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: context
                  .faColors
                  .ink
                  .primary, // Dynamically tracks content contrast safely
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
