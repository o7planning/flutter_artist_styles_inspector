// debug/tabs/component_tab_content.dart
import 'package:flutter/material.dart';
import 'package:flutter_artist_styles/flutter_artist_styles.dart';

import '../../_build_helper.dart';
import '../_example_codes.dart';

class ComponentTabContent extends StatelessWidget {
  const ComponentTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    final components = context.faTheme.tokens.components;

    return ListView(
      padding: const EdgeInsets.all(5),
      children: [
        buildAccordionGroup(
          context,
          title: "FaButtonTokens",
          icon: Icons.smart_button,
          exampleCode: FaExampleCodes.buttonExample,
          children: [
            buildMetricRow(
              context,
              label: "height",
              value: "${components.button.height} px",
            ),
            buildMetricRow(
              context,
              label: "radius",
              value: "${components.button.radius} px",
            ),
          ],
        ),
        const SizedBox(height: 12),
        buildAccordionGroup(
          context,
          title: "FaCardTokens",
          icon: Icons.credit_card_outlined,
          exampleCode: FaExampleCodes.cardExample,
          children: [
            buildMetricRow(
              context,
              label: "padding",
              value: "${components.card.padding}",
            ),
            buildMetricRow(
              context,
              label: "radius",
              value: "${components.card.radius} px",
            ),
          ],
        ),
      ],
    );
  }
}
