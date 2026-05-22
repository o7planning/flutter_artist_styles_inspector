import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_artist_styles/flutter_artist_styles.dart';

import 'enums.dart';

/// A sleek accordion board that accepts resolved color primitives and optionally
/// unrolls volumetric shadow code structures only when non-flat depth profiles are selected.
class FaCodeAccordionBoard extends StatelessWidget {
  final FaCreationType? selectedType;
  final Color resolvedBg;
  final Color resolvedInk;
  final Color resolvedStroke;
  final Color resolvedShadow;
  final double shadowBlurRadius;

  final Map<String, String> templates;

  FaCodeAccordionBoard({
    super.key,
    required this.selectedType,
    required this.resolvedBg,
    required this.resolvedInk,
    required this.resolvedStroke,
    required this.resolvedShadow,
    required this.shadowBlurRadius,
    required String bgToken,
    required String inkToken,
    required String strokeToken,
    required String shadowToken,
  }) : templates = _compileTemplates(
         bgToken,
         inkToken,
         strokeToken,
         shadowToken,
         shadowBlurRadius,
       );

  /// Dynamic helper compiling custom templates based on shadow initialization semantics.
  static Map<String, String> _compileTemplates(
    String bg,
    String ink,
    String stroke,
    String shadow,
    double radius,
  ) {
    final bool hasNoShadow = shadow == 'Colors.transparent' || shadow.isEmpty;

    final String actionStyleBody = hasNoShadow
        ? '''backgroundColor: $bg,
    foregroundColor: $ink,
    side: BorderSide(color: $stroke, width: 1.2),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),'''
        : '''backgroundColor: $bg,
    foregroundColor: $ink,
    side: BorderSide(color: $stroke, width: 1.2),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    elevation: 2.0,
    shadowColor: $shadow,''';

    final String surfaceDecorationBody = hasNoShadow
        ? '''color: $bg,
    border: Border.all(color: $stroke),
    borderRadius: BorderRadius.circular(12),'''
        : '''color: $bg,
    border: Border.all(color: $stroke),
    borderRadius: BorderRadius.circular(12),
    boxShadow: [
      BoxShadow(
        color: $shadow,
        blurRadius: ${radius.toStringAsFixed(1)},
        offset: const Offset(0, 4),
      )
    ],''';

    // ️ RE-ENGINEERED: Added discrete persistent dark zone border layout injection structures
    final String barDecorationBody = hasNoShadow
        ? '''color: $bg,
    border: Border(bottom: BorderSide(color: $stroke, width: 1.5)),'''
        : '''color: $bg,
    border: Border(bottom: BorderSide(color: $stroke, width: 1.5)),
    boxShadow: [
      BoxShadow(
        color: $shadow,
        blurRadius: ${radius.toStringAsFixed(1)},
        offset: const Offset(0, 2),
      )
    ],''';

    return {
      'action_1':
          '''TextButton.icon(
  style: TextButton.styleFrom(
    $actionStyleBody
  ),
  icon: const Icon(Icons.bolt, size: 18),
  label: const Text('Execute Action'),
  onPressed: () {},
)''',
      'surface':
          '''Container(
  width: double.infinity,
  padding: const EdgeInsets.all(16),
  decoration: BoxDecoration(
    $surfaceDecorationBody
  ),
  child: Text(
    'Workspace Interface Block Layout',
    style: TextStyle(color: $ink, fontSize: 15, fontWeight: FontWeight.bold),
    textAlign: TextAlign.center,
  ),
)''',
      //  FIXED: Đã cấy thành công bộ mẫu sinh mã nguồn cho thanh BAR điều hướng
      'bar':
          '''Container(
  height: 60,
  width: double.infinity,
  padding: const EdgeInsets.symmetric(horizontal: 16),
  decoration: BoxDecoration(
    $barDecorationBody
  ),
  child: Row(
    children: [
      Icon(Icons.dashboard_customize, color: $ink),
      const SizedBox(width: 16),
      Text(
        'Enterprise Suite Navigation Anchor',
        style: TextStyle(color: $ink, fontSize: 14, fontWeight: FontWeight.bold),
      ),
    ],
  ),
)''',
    };
  }

  @override
  Widget build(BuildContext context) {
    if (selectedType == null) {
      return Center(
        child: Text(
          'Select options on the left stepping board sequentially to compile architectural structures.',
          style: TextStyle(
            color: context.faColors.ink.tertiaryQuiet,
            fontSize: 12,
          ),
          textAlign: TextAlign.center,
        ),
      );
    }

    final maps = templates;
    final hasNoShadow = resolvedShadow == Colors.transparent;

    final shadowDecorationList = [
      if (!hasNoShadow)
        BoxShadow(
          color: resolvedShadow,
          blurRadius: shadowBlurRadius,
          offset: const Offset(0, 3),
        ),
    ];

    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        // Nhánh ACTION
        if (selectedType == FaCreationType.action) ...[
          _buildAccordionItem(
            context: context,
            title: 'Option 1: TextButton.icon Structure Blueprint',
            codeSnippet: maps['action_1']!,
            previewWidget: Container(
              decoration: BoxDecoration(
                boxShadow: shadowDecorationList,
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextButton.icon(
                style: TextButton.styleFrom(
                  backgroundColor: resolvedBg,
                  foregroundColor: resolvedInk,
                  side: BorderSide(color: resolvedStroke, width: 1.2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                icon: const Icon(Icons.bolt, size: 18),
                label: const Text('Execute Action'),
                onPressed: () {},
              ),
            ),
          ),
        ],

        // Nhánh SURFACE
        if (selectedType == FaCreationType.surface)
          _buildAccordionItem(
            context: context,
            title: 'Structural Panel Layout Element',
            codeSnippet: maps['surface']!,
            previewWidget: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: resolvedBg,
                border: Border.all(color: resolvedStroke),
                borderRadius: BorderRadius.circular(12),
                boxShadow: shadowDecorationList,
              ),
              child: Text(
                'Workspace Interface Block Layout',
                style: TextStyle(
                  color: resolvedInk,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        if (selectedType == FaCreationType.bar)
          _buildAccordionItem(
            context: context,
            title: 'Enterprise Suite Navigation TopBar Blueprint',
            codeSnippet: maps['bar']!,
            previewWidget: Container(
              height: 50,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: resolvedBg,
                border: Border(
                  bottom: BorderSide(color: resolvedStroke, width: 1.5),
                ),
                boxShadow: shadowDecorationList,
              ),
              child: Row(
                children: [
                  Icon(Icons.dashboard_customize, color: resolvedInk, size: 18),
                  const SizedBox(width: 12),
                  Text(
                    'Enterprise Suite Navigation Anchor',
                    style: TextStyle(
                      color: resolvedInk,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildAccordionItem({
    required BuildContext context,
    required String title,
    required Widget previewWidget,
    required String codeSnippet,
  }) {
    // We safely migrate the boundary decorations and surface color to native Material configuration rules
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(bottom: 12),
      child: Material(
        color: context.faColors.surface.standard,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: context.faColors.stroke.subtle),
        ),
        child: Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            title: Text(
              title,
              style: TextStyle(
                color: context.faColors.ink.primary,
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
            leading: Icon(
              Icons.token,
              color: context.faColors.action.ink.primary,
              size: 20,
            ),
            childrenPadding: const EdgeInsets.all(16),
            expandedCrossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Live Component Preview',
                style: TextStyle(
                  fontSize: 11,
                  color: context.faColors.ink.secondary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Center(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  width: double.infinity,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: context.faColors.surface.subtle,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: previewWidget,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Clean Blueprint Code Source',
                    style: TextStyle(
                      fontSize: 11,
                      color: context.faColors.ink.secondary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.copy_all, size: 18),
                    tooltip: 'Copy Code Structure',
                    onPressed: () {
                      Clipboard.setData(ClipboardData(text: codeSnippet));
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Component template copied to clipboard!',
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: context.faColors.surface.emphasized,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: SelectableText(
                  codeSnippet,
                  style: TextStyle(
                    fontFamily: 'Courier',
                    fontSize: 12,
                    color: context.faColors.ink.technical,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
