import 'package:flutter/material.dart';
import 'package:flutter_artist_styles/flutter_artist_styles.dart';

import '_base_tab_content_state.dart';

/// Gallery layout panel dedicated to rendering, testing, and inspecting
/// absolute, immutable baseline color primitives and utility constants.
class CommonTabContent extends FaColorsBaseTabContent {
  const CommonTabContent({super.key, required super.langCode})
    : super(tabId: "common");

  @override
  State<CommonTabContent> createState() => _CommonTabContentState();
}

class _CommonTabContentState
    extends FaColorsBaseTabContentState<CommonTabContent> {
  @override
  List<MapEntry<String, FaColor>> getColorCodeData() {
    // Dynamic self-reflection layout parsing yields a clean single-line registry mapping
    return context.faColors.common.allTokens
        .map((color) => MapEntry(color.tokenName, color))
        .toList();
  }

  @override
  String getDescription() {
    return "Common Namespace contains baseline utility constants. "
        "These are immutable primitives used across core painting and overlay bounds.";
  }

  @override
  Widget buildGallery(BuildContext context) {
    final com = context.faColors.common;

    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.zero,
      children: [
        buildGroup(context, "Common Utilities", [
          Wrap(
            spacing: 16,
            runSpacing: 12,
            children: [
              _colorCircle(context, "White", com.white, "white"),
              _colorCircle(context, "Black", com.black, "black"),
              _colorCircle(
                context,
                "Transparent",
                com.transparent,
                "transparent",
              ),
            ],
          ),
        ]),
      ],
    );
  }

  /// Compiles an absolute immutable baseline color primitive circle shortcut trigger.
  Widget _colorCircle(
    BuildContext context,
    String label,
    FaColor color,
    String tokenShortKey,
  ) {
    final code =
        "// Absolute baseline immutable primitive constant\n"
        "Color targetColor = context.faColors.common.$tokenShortKey;";

    return InkWell(
      onTap: () => updateCode(code),
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
                border: Border.all(
                  color: context.faColors.divider.subtle,
                  width: 1,
                ),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: context.faColors.ink.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
