import 'package:flutter/material.dart';
import 'package:flutter_artist_markdown_widget/flutter_artist_markdown_widget.dart';
import 'package:flutter_artist_styles/flutter_artist_styles.dart';
import 'package:flutter_left_right_container/left_right_container.dart';
import 'package:tabbed_view/tabbed_view.dart';

import '../../../_endpoint.dart';
import '../../utils/tab_theme_utils.dart';
import '../../widget/fa_color_code_table.dart';
import 'state_tab_content.dart';

abstract class FaColorsBaseTabContent extends StatefulWidget {
  final String langCode;

  /// "selection", "ink",...
  final String tabId;

  const FaColorsBaseTabContent({
    required this.langCode,
    required this.tabId,
    super.key,
  });
}

abstract class FaColorsBaseTabContentState<W extends FaColorsBaseTabContent>
    extends State<W> {
  int _currentRightTabIndex = 0;
  MapEntry<String, FaColor>? _selectedTokenEntry;
  late final ValueNotifier<String> langCodeNotifier;

  TabbedViewController? _leftController;
  TabbedViewController? _rightController;

  @override
  void initState() {
    super.initState();
    langCodeNotifier = ValueNotifier(widget.langCode);
  }

  String _getTabUsageUrl() {
    return "$faColorsBaseURL/${widget.tabId}/${widget.tabId}-${widget.langCode}.md";
  }

  String _getSelectedTokenUsageUrl(String? token) {
    return "$faColorsBaseURL/${widget.tabId}/$token-${widget.langCode}.md";
  }

  void updateCode(String code) {
    // Do nothing
  }

  String getDescription();

  Widget buildGallery(BuildContext context);

  List<MapEntry<String, FaColor>> getColorCodeData();

  @override
  void didUpdateWidget(covariant W oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.langCode != widget.langCode) {
      langCodeNotifier.value = widget.langCode;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_leftController == null) {
      _leftController = TabbedViewController(_getLeftTabs());
    } else {
      _leftController!.setTabs(_getLeftTabs());
    }

    if (_rightController == null) {
      _rightController = TabbedViewController(_getRightTabs());
      _rightController!.addListener(() {
        setState(() {
          _currentRightTabIndex = _rightController!.selectedIndex ?? 0;
        });
      });
    } else {
      int currentIndex = _rightController!.selectedIndex ?? 0;
      _rightController!.setTabs(_getRightTabs());
      _rightController!.selectedIndex = currentIndex;
    }
  }

  @override
  void dispose() {
    super.dispose();
    _leftController?.dispose();
    _rightController?.dispose();
  }

  List<TabData> _getLeftTabs() {
    return [
      TabData(
        id: "tokens",
        text: 'Tokens',
        view: Column(
          children: [
            _buildDescription(context),
            const SizedBox(height: 10),
            Expanded(
              child: FaColorCodeTable(
                data: getColorCodeData(),
                onRowTap: _onTokenSelected,
              ),
            ),
          ],
        ),
        closable: false,
        draggable: false,
      ),
      TabData(
        id: "guide",
        text: 'Guide',
        view: ValueListenableBuilder(
          valueListenable: langCodeNotifier,
          builder: (_, langCode, _) {
            return FaMarkdownWidget.url(url: _getTabUsageUrl());
          },
        ),
        closable: false,
      ),
    ];
  }

  List<TabData> _getRightTabs() {
    return [
      TabData(
        id: "preview",
        text: 'Live Preview',
        view: buildGallery(context),
        closable: false,
      ),
      TabData(
        id: "state",
        text: 'State',
        view: StateTabContent(
          colorPrefix: _selectedTokenEntry?.key,
          originColor: _selectedTokenEntry?.value,
        ),
        closable: false,
      ),
      TabData(
        id: "docs",
        text: 'Token Docs',
        view: ValueListenableBuilder(
          valueListenable: langCodeNotifier,
          builder: (_, langCode, _) {
            return FaMarkdownWidget.url(
              url: _getSelectedTokenUsageUrl(_selectedTokenEntry?.key),
            );
          },
        ),
        closable: false,
      ),
    ];
  }

  void _onTokenSelected(MapEntry<String, FaColor> tokenEntry) {
    final targetIndex = _currentRightTabIndex == 0 ? 1 : _currentRightTabIndex;

    setState(() {
      _selectedTokenEntry = tokenEntry;
      _rightController?.setTabs(_getRightTabs());
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_rightController != null &&
          _rightController!.selectedIndex != targetIndex) {
        _rightController!.selectedIndex = targetIndex;
      }
    });
  }

  Widget _buildLeftTabSystem() {
    return TabbedViewTheme(
      data: TabThemeUtils.getTabbedViewThemeData(context),
      child: TabbedView(controller: _leftController!),
    );
  }

  Widget _buildRightTabSystem() {
    return TabbedViewTheme(
      data: TabThemeUtils.getTabbedViewThemeData(context),
      child: TabbedView(controller: _rightController!),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LeftRightContainer(
      fixedSizeWidth: 420,
      minSideWidth: 350,
      fixedSide: FixedSide.start,
      spacing: 16,
      style: LeftRightContainerStyle(
        startPadding: const EdgeInsets.all(0),
        endPadding: const EdgeInsets.all(0),
      ),
      showVerticalDivider: true,
      start: _buildLeftTabSystem(),
      end: _buildRightTabSystem(),
    );
  }

  Widget _buildDescription(BuildContext context) {
    final desc = getDescription();
    if (desc.isEmpty) return const SizedBox.shrink();

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: context.faColors.surface.muted,
        borderRadius: BorderRadius.circular(8),
        border: Border(
          left: BorderSide(color: context.faColors.stroke.strong, width: 4),
        ),
      ),
      child: SelectableText(
        desc,
        style: TextStyle(
          fontSize: 13,
          color: context.faColors.ink.secondary,
          height: 1.5,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }

  Widget buildGroup(BuildContext context, String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title.toUpperCase(),
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.bold,
            color: context.faColors.ink.label,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 12),
        Wrap(spacing: 10, runSpacing: 10, children: children),
      ],
    );
  }

  Widget ink(BuildContext context, Widget child, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: child,
    );
  }
}
