import 'package:flutter/material.dart';
import 'package:flutter_artist_styles/flutter_artist_styles.dart';

import '../../_build_helper.dart';
import '../_example_codes.dart';

class LayoutTabContent extends StatelessWidget {
  const LayoutTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    final layout = context.faTheme.tokens.layout;
    return ListView(
      padding: const EdgeInsets.all(5),
      children: [
        buildAccordionGroup(
          context,
          title: "FaLayoutMetricsTokens",
          icon: Icons.straighten,
          exampleCode: FaExampleCodes.layoutExample,
          children: [
            buildMetricRow(
              context,
              label: "Sidebar Width",
              value: "${layout.sidebarWidth} px",
            ),
            buildMetricRow(
              context,
              label: "Content Max Width",
              value: layout.contentMaxWidth?.toString() ?? "Infinity",
            ),
          ],
        ),
        buildAccordionGroup(
          context,
          title: "FaLayoutColorTokens",
          icon: Icons.layers_outlined,
          exampleCode: FaExampleCodes.layoutExample,
          children: [],
        ),
      ],
    );
  }
}
