import 'package:flutter/material.dart';
import 'package:flutter_artist_commons_ui/flutter_artist_commons_ui.dart';
import 'package:flutter_artist_styles/flutter_artist_styles.dart';
import 'package:tabbed_view/tabbed_view.dart';

import 'debug/fa_colors/tabs/action_tab_content.dart';
import 'debug/fa_colors/tabs/bar_tab_content.dart';
import 'debug/fa_colors/tabs/common_tab_content.dart';
import 'debug/fa_colors/tabs/divider_tab_content.dart';
import 'debug/fa_colors/tabs/ink_tab_content.dart';
import 'debug/fa_colors/tabs/input_tab_content.dart';
import 'debug/fa_colors/tabs/overview_tab_content.dart';
import 'debug/fa_colors/tabs/shadow_tab_content.dart';
import 'debug/fa_colors/tabs/stroke_tab_content.dart';
import 'debug/fa_colors/tabs/surface_tab_content.dart';
import 'debug/generator/code_generator_view.dart';
import 'debug/utils/tab_theme_utils.dart';

class FaColorsInspectorDialog extends StatefulWidget {
  const FaColorsInspectorDialog({super.key});

  static Future<void> show(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (_) {
        return const FaColorsInspectorDialog();
      },
    );
  }

  @override
  State<FaColorsInspectorDialog> createState() =>
      _FaColorsInspectorDialogState();
}

class _FaColorsInspectorDialogState extends State<FaColorsInspectorDialog> {
  String _currentLangCode = 'en';
  TabbedViewController? _tabController;
  int _currentIdx = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _tabController ??= TabbedViewController(_buildTabs());
  }

  void _changeLang(String lang) {
    if (_currentLangCode == lang) return;

    setState(() {
      _currentIdx = _tabController?.selectedIndex ?? 0;
      _currentLangCode = lang;
      _tabController?.setTabs(_buildTabs());
      _tabController?.selectedIndex = _currentIdx;
    });
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  List<TabData> _buildTabs() {
    return [
      TabData(
        id: "Generator",
        text: 'Generator',
        view: FaColorsCodeGeneratorView(langCode: _currentLangCode),
        closable: false,
      ),
      TabData(
        id: "Overview",
        text: 'Overview',
        view: OverviewTabContent(langCode: _currentLangCode),
        closable: false,
      ),
      TabData(
        id: "Action",
        text: 'Action',
        view: ActionTabContent(langCode: _currentLangCode),
        closable: false,
      ),
      TabData(
        id: "Surface",
        text: 'Surface',
        view: SurfaceTabContent(langCode: _currentLangCode),
        closable: false,
      ),
      TabData(
        id: "Bar",
        text: 'Bar',
        view: BarTabContent(langCode: _currentLangCode),
        closable: false,
      ),
      TabData(
        id: "Ink",
        text: 'Ink',
        view: InkTabContent(langCode: _currentLangCode),
        closable: false,
      ),
      TabData(
        id: "Stroke",
        text: 'Stroke',
        view: StrokeTabContent(langCode: _currentLangCode),
        closable: false,
      ),
      TabData(
        id: "Shadow",
        text: 'Shadow',
        view: ShadowTabContent(langCode: _currentLangCode),
        closable: false,
      ),
      TabData(
        id: "Input",
        text: 'Input',
        view: InputTabContent(langCode: _currentLangCode),
        closable: false,
      ),
      TabData(
        id: "Divider",
        text: 'Divider',
        view: DividerTabContent(langCode: _currentLangCode),
        closable: false,
      ),
      TabData(
        id: "Common",
        text: 'Common',
        view: CommonTabContent(langCode: _currentLangCode),
        closable: false,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    if (_tabController == null) return const SizedBox.shrink();

    final Size preferSize = calculateDialogSize(
      context,
      preferredWidth: 1000,
      preferredHeight: 600,
    );

    return FaDialog(
      titleText: "Debug FaColors Inspector",
      iconData: Icons.palette_outlined,
      preferredContentWidth: preferSize.width,
      preferredContentHeight: preferSize.height,
      contentPadding: const EdgeInsets.all(5),
      content: Stack(
        children: [
          TabbedViewTheme(
            data: TabThemeUtils.getTabbedViewThemeData(context),
            child: TabbedView(controller: _tabController!),
          ),
          _buildLanguageFab(context),
        ],
      ),
    );
  }

  Widget _buildLanguageFab(BuildContext context) {
    return Positioned(
      bottom: 16,
      right: 16,
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _langBtn(context, 'en'),
            const SizedBox(width: 4),
            _langBtn(context, 'vi'),
          ],
        ),
      ),
    );
  }

  Widget _langBtn(BuildContext context, String langCode) {
    final bool isSelected = _currentLangCode == langCode;

    // ✅ IMPORTANT: Use Material
    return Material(
      color: isSelected
          ? context.faColors.action.fill.primaryTonal
          : context.faColors.action.fill.secondaryTonal,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: () => _changeLang(langCode),
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FlagCdnView.flagHeight(langCode: langCode, height: 10),
              const SizedBox(width: 4),
              Text(
                langCode.toUpperCase(),
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: isSelected
                      ? context.faColors.action.ink.primary
                      : context.faColors.action.ink.secondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
