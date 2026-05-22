import 'package:flutter/material.dart';
import 'package:flutter_artist_styles/flutter_artist_styles.dart';

import '_base_tab_content_state.dart';

/// Gallery layout panel dedicated to rendering, testing, and inspecting
/// dynamic background fills, outline contours, and typography state inks inside form fields.
class InputTabContent extends FaColorsBaseTabContent {
  const InputTabContent({super.key, required super.langCode})
    : super(tabId: "input");

  @override
  State<InputTabContent> createState() => _InputTabContentState();
}

class _InputTabContentState
    extends FaColorsBaseTabContentState<InputTabContent> {
  @override
  List<MapEntry<String, FaColor>> getColorCodeData() {
    // Dynamic self-reflection layout parsing yields a clean single-line registry mapping
    return context.faColors.input.allTokens
        .map((color) => MapEntry(color.tokenName, color))
        .toList();
  }

  @override
  String getDescription() {
    return "Input Namespace defines the visual language for form elements. "
        "It maintains a neutral background (surfaceContainerLow) to ensure text readability "
        "and uses Primary only for the focused state border.";
  }

  @override
  Widget buildGallery(BuildContext context) {
    final inputTokens = context.faColors.input;

    // Compiles a standalone template code blueprint to forward directly on user pointer taps
    const compiledTextFieldCode =
        "TextField(\n"
        "  decoration: InputDecoration(\n"
        "    filled: true,\n"
        "    fillColor: context.faColors.input.fill.enabled,\n"
        "    hintText: 'Enter text...',\n"
        "    hintStyle: TextStyle(color: context.faColors.input.ink.muted),\n"
        "    labelStyle: TextStyle(color: context.faColors.input.input.secondary),\n"
        "    enabledBorder: OutlineInputBorder(\n"
        "      borderSide: BorderSide(color: context.faColors.input.stroke.enabled),\n"
        "    ),\n"
        "    focusedBorder: OutlineInputBorder(\n"
        "      borderSide: BorderSide(color: context.faColors.input.stroke.focused, width: 2),\n"
        "    ),\n"
        "  ),\n"
        ");";

    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.zero,
      children: [
        buildGroup(context, "Text Fields", [
          ink(
            context,
            TextField(
              enabled: true,
              style: TextStyle(color: inputTokens.ink.primary, fontSize: 14),
              decoration: InputDecoration(
                filled: true,
                fillColor: inputTokens.fill.enabled,
                hintText: "Normal Input Field State",
                hintStyle: TextStyle(
                  color: inputTokens.ink.tertiaryQuiet,
                  fontSize: 13,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: inputTokens.stroke.enabled),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: inputTokens.stroke.focused,
                    width: 2,
                  ),
                ),
              ),
            ),
            () => updateCode(compiledTextFieldCode),
          ),
          const SizedBox(height: 16),
          ink(
            context,
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: inputTokens.fill.enabled,
                border: Border.all(
                  color: inputTokens.stroke.focused,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                children: [
                  Text(
                    "Active Input Focus Simulation",
                    style: TextStyle(
                      color: inputTokens.ink.primary,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.edit_note,
                    size: 16,
                    color: inputTokens.ink.secondary,
                  ),
                ],
              ),
            ),
            () => updateCode(compiledTextFieldCode),
          ),
        ]),
      ],
    );
  }
}
