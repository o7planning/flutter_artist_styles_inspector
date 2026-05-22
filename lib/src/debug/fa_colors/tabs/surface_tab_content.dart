import 'package:flutter/material.dart';
import 'package:flutter_artist_styles/flutter_artist_styles.dart';

import '_base_tab_content_state.dart';

/// Gallery layout panel dedicated to rendering, testing, and inspecting
/// structural interface canvas backings, layout elevation depths, and invariant contrast zones.
class SurfaceTabContent extends FaColorsBaseTabContent {
  const SurfaceTabContent({super.key, required super.langCode})
    : super(tabId: "surface");

  @override
  State<SurfaceTabContent> createState() => _SurfaceTabContentState();
}

class _SurfaceTabContentState
    extends FaColorsBaseTabContentState<SurfaceTabContent> {
  @override
  List<MapEntry<String, FaColor>> getColorCodeData() {
    // Dynamic self-reflection layout parsing yields a clean single-line registry mapping
    return context.faColors.surface.allTokens
        .map((color) => MapEntry(color.tokenName, color))
        .toList();
  }

  @override
  String getDescription() {
    return "Surface Namespace manages the structural layers, elevation, and depth of the UI. "
        "Standard tokens support standard app grounding, while Inverse tokens enforce "
        "fixed dark regions (e.g., Sidebars, Topbars) regardless of the global system brightness mode.";
  }

  @override
  Widget buildGallery(BuildContext context) {
    final s = context.faColors.surface;

    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.zero,
      children: [
        // =====================================================================
        // 1. STANDARD APPLICATION SURFACES HIERARCHY
        // =====================================================================
        buildGroup(context, "Standard App Surfaces (Z-Index Hierarchy)", [
          _surfaceBox(
            context,
            "ground",
            s.ground,
            "Scaffold baseline layer color.",
            false,
          ),
          _surfaceBox(
            context,
            "subtle",
            s.subtle,
            "Lowest density container embedding backing.",
            false,
          ),
          _surfaceBox(
            context,
            "muted",
            s.muted,
            "Sunken content sections background color.",
            false,
          ),
          _surfaceBox(
            context,
            "standard",
            s.standard,
            "Standard layout card or dialog background bounding.",
            false,
          ),
          _surfaceBox(
            context,
            "emphasized",
            s.emphasized,
            "Elevated interactive component surface layer.",
            false,
          ),
          _surfaceBox(
            context,
            "strong",
            s.strong,
            "Highest floating depth contextual component container.",
            false,
          ),
        ]),

        const SizedBox(height: 32),

        // =====================================================================
        // 2. INVERTED LAYOUT CONTRAST ZONES (INVARIANT DARK SURFACES)
        // =====================================================================
        buildGroup(
          context,
          "Inverted Dark Zone Layout Surfaces (Invariant Dark)",
          [
            _surfaceBox(
              context,
              "inverseGround",
              s.inverseGround,
              "Dark fixed base for structural components like Sidebars.",
              true,
            ),
            _surfaceBox(
              context,
              "inverseSubtle",
              s.inverseSubtle,
              "Inverted layout structural level 1 background overlay.",
              true,
            ),
            _surfaceBox(
              context,
              "inverseMuted",
              s.inverseMuted,
              "Inverted layout internal section container background.",
              true,
            ),
            _surfaceBox(
              context,
              "inverseStandard",
              s.inverseStandard,
              "Standard card panel backing within inverted layout bounds.",
              true,
            ),
            _surfaceBox(
              context,
              "inverseEmphasized",
              s.inverseEmphasized,
              "Elevated overlay components inner dark canvas bounds.",
              true,
            ),
            _surfaceBox(
              context,
              "inverseStrong",
              s.inverseStrong,
              "Highest visual depth anchor backing within inverted layouts.",
              true,
            ),
          ],
        ),
      ],
    );
  }

  /// Compiles an interactive surface presentation container block linked to the code blueprint view.
  Widget _surfaceBox(
    BuildContext context,
    String tokenKey,
    Color color,
    String desc,
    bool isInverse,
  ) {
    final code =
        "Container(\n"
        "  padding: const EdgeInsets.all(12),\n"
        "  decoration: BoxDecoration(\n"
        "    color: context.faColors.surface.$tokenKey,\n"
        "    borderRadius: BorderRadius.circular(8),\n"
        "  ),\n"
        "  child: const Text('$tokenKey'),\n"
        ");";

    // Optimized adaptive contrast foreground resolution mechanism driven by token semantic signatures
    final inkTokens = context.faColors.ink;
    Color resolvedInkColor = isInverse
        ? inkTokens.inversePrimary
        : inkTokens.primary;

    return InkWell(
      onTap: () => updateCode(code),
      borderRadius: BorderRadius.circular(8),
      child: Tooltip(
        message: desc,
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: context.faColors.stroke.subtle),
          ),
          child: Row(
            children: [
              Text(
                tokenKey,
                style: TextStyle(
                  color: resolvedInkColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
              ),
              const Spacer(),
              Icon(
                Icons.layers_outlined,
                size: 16,
                color: resolvedInkColor.withValues(alpha: 0.6),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
