import 'package:flutter/material.dart';
import 'package:flutter_artist_styles/flutter_artist_styles.dart';

import '../codes/fa_codes.dart';
import '_base_tab_content_state.dart';

class ActionTabContent extends FaColorsBaseTabContent {
  const ActionTabContent({required super.langCode, super.key})
    : super(tabId: "action");

  @override
  State<ActionTabContent> createState() => _ActionTabContentState();
}

class _ActionTabContentState
    extends FaColorsBaseTabContentState<ActionTabContent> {
  @override
  Widget buildGallery(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(0),
      children: [
        // =====================================================================
        // 1. STANDARD CORE MATERIAL BUTTON ACTIONS
        // =====================================================================
        buildGroup(context, "Standard Material Actions", [
          _btn(
            context,
            "Primary",
            isPrimary: true,
            () => updateCode(FaCodes.primaryBtn),
          ),
          _btn(
            context,
            "Secondary",
            () => updateCode(FaCodes.secondaryBtn),
            isOutlined: true,
          ),
          _btn(
            context,
            "Ghost",
            () => updateCode(FaCodes.ghostBtn),
            isGhost: true,
          ),
        ]),
        const SizedBox(height: 24),

        // =====================================================================
        // 2. STATE COMPONENT SELECTIONS
        // =====================================================================
        buildGroup(context, "Soft Selected Components", [
          ink(
            context,
            _buildSampleChip(context),
            () => updateCode(FaCodes.sampleChip),
          ),
          ink(
            context,
            _buildSoftBadge(context),
            () => updateCode(FaCodes.softBadge),
          ),
        ]),
        const SizedBox(height: 24),

        // =====================================================================
        // 3. SEMANTIC HEALTH INDICATORS & HIGHLIGHTS
        // =====================================================================
        buildGroup(context, "Semantic & Highlight", [
          _btn(
            context,
            "Danger Action",
            () => updateCode(FaCodes.dangerBtn),
            isDanger: true,
          ),
          _btn(
            context,
            "Error Action",
            () => updateCode(FaCodes.errorBtn),
            isError: true,
          ),
          ink(
            context,
            _buildTechHighlight(context),
            () => updateCode(FaCodes.techHighlight),
          ),
        ]),
      ],
    );
  }

  @override
  List<MapEntry<String, FaColor>> getColorCodeData() {
    return context.faColors.action.allTokens
        .map((color) => MapEntry(color.tokenName, color))
        .toList();
  }

  @override
  String getDescription() {
    return "Action Namespace provides standardized colors for buttons, chips, and semantic status icons. "
        "Use these tokens to maintain uniform call-to-action styles across the application.";
  }

  // ===========================================================================
  // INTERACTIVE VISUAL BLUEPRINT BUILDERS
  // ===========================================================================

  /// Compiles a realistic live user badge component rendering active state transformations.
  Widget _buildSampleChip(BuildContext context) {
    final actionFill = context.faColors.action.fill;
    final actionInk = context.faColors.action.ink;

    return Tooltip(
      decoration: BoxDecoration(
        color: context.faColors.surface.emphasized,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: context.faColors.divider.strong),
      ),
      constraints: const BoxConstraints(maxWidth: 220),
      richMessage: TextSpan(
        text: 'Selected Contributor Chip\n',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: context.faColors.ink.primary,
        ),
        children: [
          TextSpan(
            text:
                'Used for highlighting an active entity using selection surface colors.',
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 11,
              color: context.faColors.ink.secondary,
            ),
          ),
        ],
      ),
      child: InkWell(
        onTap: () => updateCode(FaCodes.sampleChip),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: actionFill.primary.selected,
            // Invokes the dynamic state evaluation engine pipeline directly
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: context.faColors.action.stroke.primary),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.person,
                size: 14,
                color: actionInk
                    .onPrimaryFill
                    .selected, // Ensures crisp background/foreground coordination
              ),
              const SizedBox(width: 6),
              Text(
                "Selected Chip",
                style: TextStyle(
                  color: actionInk.onPrimaryFill,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Compiles a small metadata tag indicator processing secondary interface behaviors.
  Widget _buildSoftBadge(BuildContext context) {
    final actionFill = context.faColors.action.fill;
    final actionInk = context.faColors.action.ink;

    return Tooltip(
      message:
          'Soft State Badge:\nCompact label for secondary status indicators using subtle action colors.',
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: actionFill.secondary.selected,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          "SOFT BADGE",
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.bold,
            color: actionInk.onSecondaryFill.selected,
          ),
        ),
      ),
    );
  }

  /// Compiles a high-visibility structural box signaling system telemetries.
  Widget _buildTechHighlight(BuildContext context) {
    return Tooltip(
      message:
          'Technical Highlight:\nUsed for specialized triggers or system-level action icons.',
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: context.faColors.action.fill.highlight,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Icon(
          Icons.bolt,
          color: context
              .faColors
              .action
              .ink
              .onHighlightFill, // Fixed structural core proxy alignment error
          size: 18,
        ),
      ),
    );
  }

  /// Orchestrates standardized action buttons bounding layout interactions.
  Widget _btn(
    BuildContext context,
    String label,
    VoidCallback onTap, {
    bool isPrimary = false,
    bool isOutlined = false,
    bool isGhost = false,
    bool isDanger = false,
    bool isError = false,
  }) {
    if (isGhost) return TextButton(onPressed: onTap, child: Text(label));
    if (isOutlined) return OutlinedButton(onPressed: onTap, child: Text(label));

    final Color bgColor;
    final Color textColor;
    if (isPrimary) {
      bgColor = context.faColors.action.fill.primary;
      textColor = context.faColors.action.ink.onPrimaryFill;
    } else if (isDanger) {
      bgColor = context.faColors.action.fill.danger;
      textColor = context.faColors.action.ink.onDangerFill;
    } else if (isError) {
      bgColor = context.faColors.action.fill.error;
      textColor = context.faColors.action.ink.onErrorFill;
    } else {
      bgColor = context.faColors.action.fill.secondary;
      textColor = context.faColors.action.ink.onSecondaryFill;
    }

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        foregroundColor: textColor,
      ),
      onPressed: onTap,
      child: Text(label),
    );
  }
}
