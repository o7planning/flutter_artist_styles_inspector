import 'package:flutter/material.dart';
import 'package:flutter_artist_commons_ui/flutter_artist_commons_ui.dart';
import 'package:tabbed_view/tabbed_view.dart';

import 'debug/fa_theme/tabs/color_tab_content.dart';
import 'debug/fa_theme/tabs/component_tab_content.dart';
import 'debug/fa_theme/tabs/general_tab_content.dart';
import 'debug/fa_theme/tabs/layout_tab_content.dart';
import 'debug/fa_theme/tabs/others_tab_content.dart';
import 'debug/fa_theme/tabs/typography_tab_content.dart';
import 'debug/utils/tab_theme_utils.dart';

class FaThemeInspectorDialog extends StatelessWidget {
  const FaThemeInspectorDialog({super.key});

  static Future<void> show(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (_) {
        return const FaThemeInspectorDialog();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size preferSize = Size(1000, 600);

    return FaDialog(
      titleText: "Debug Theme Inspector",
      iconData: Icons.palette_outlined,
      preferredContentWidth: preferSize.width,
      preferredContentHeight: preferSize.height,
      contentPadding: EdgeInsets.all(5),
      content: _buildTabSystem(context),
    );
  }

  Widget _buildTabSystem(BuildContext context) {
    List<TabData> tabs = [
      TabData(
        id: "General",
        text: 'General',
        view: const GeneralTabContent(),
        closable: false,
      ),
      TabData(
        id: "Colors",
        text: 'Colors',
        view: const ColorTabContent(),
        closable: false,
      ),
      TabData(
        id: 'Typography',
        text: 'Typography',
        view: const TypographyTabContent(),
        closable: false,
      ),
      TabData(
        id: 'Layout',
        text: 'Layout',
        view: const LayoutTabContent(),
        closable: false,
      ),
      TabData(
        id: 'Components',
        text: 'Components',
        view: const ComponentTabContent(),
        closable: false,
      ),
      TabData(
        id: 'Others',
        text: 'Others',
        view: const OthersTabContent(),
        closable: false,
      ),
    ];

    TabbedViewController controller = TabbedViewController(tabs);
    return TabbedViewTheme(
      data: TabThemeUtils.getTabbedViewThemeData(context),
      child: TabbedView(controller: controller),
    );
  }
}
