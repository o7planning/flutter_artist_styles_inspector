import 'package:flutter/material.dart';
import 'package:flutter_artist_styles/flutter_artist_styles.dart';

import '../../_build_helper.dart';
import '../_example_codes.dart';

class OthersTabContent extends StatelessWidget {
  const OthersTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    final tokens = context.faTheme.tokens;

    return ListView(
      padding: const EdgeInsets.all(5),
      children: [
        // RADIUS
        buildAccordionGroup(
          context,
          title: "FaRadiusTokens",
          icon: Icons.rounded_corner,
          exampleCode: FaExampleCodes.radiusExample,
          children: [
            buildMetricRow(
              context,
              label: "Small (SM)",
              value: "${tokens.radius.sm} px",
            ),
            buildMetricRow(
              context,
              label: "Medium (MD)",
              value: "${tokens.radius.md} px",
            ),
            buildMetricRow(
              context,
              label: "Large (LG)",
              value: "${tokens.radius.lg} px",
            ),
            buildRadiusPreview(
              context,
              label: "Preview (MD)",
              radius: tokens.radius.md,
            ),
          ],
        ),

        // ELEVATION
        buildAccordionGroup(
          context,
          title: "FaElevationTokens",
          icon: Icons.layers,
          exampleCode: FaExampleCodes.elevationExample,
          children: [
            buildMetricRow(
              context,
              label: "Level 1",
              value: "${tokens.elevation.level1}",
            ),
            buildMetricRow(
              context,
              label: "Level 2",
              value: "${tokens.elevation.level2}",
            ),
            buildMetricRow(
              context,
              label: "Level 3",
              value: "${tokens.elevation.level3}",
            ),
          ],
        ),

        // MOTION
        buildAccordionGroup(
          context,
          title: "FaMotionTokens",
          icon: Icons.slow_motion_video,
          exampleCode: FaExampleCodes.motionExample,
          children: [
            buildMetricRow(
              context,
              label: "Fast",
              value: "${tokens.motion.fast.inMilliseconds}ms",
            ),
            buildMetricRow(
              context,
              label: "Normal",
              value: "${tokens.motion.normal.inMilliseconds}ms",
            ),
            buildMetricRow(
              context,
              label: "Slow",
              value: "${tokens.motion.slow.inMilliseconds}ms",
            ),
          ],
        ),
      ],
    );
  }
}
