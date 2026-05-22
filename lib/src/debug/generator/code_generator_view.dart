import 'package:flutter/material.dart';
import 'package:flutter_artist_styles/flutter_artist_styles.dart';
import 'package:flutter_left_right_container/flutter_left_right_container.dart';

import 'blueprint.dart';
import 'code_board.dart';
import 'enums.dart';
import 'fa_token_option.dart';
import 'token.dart';

class _FaStepMetadata {
  final String title;
  final String description;

  const _FaStepMetadata({required this.title, required this.description});
}

class FaColorsCodeGeneratorView extends StatefulWidget {
  final String langCode;

  const FaColorsCodeGeneratorView({super.key, required this.langCode});

  @override
  State<FaColorsCodeGeneratorView> createState() =>
      _FaColorsCodeGeneratorViewState();
}

class _FaColorsCodeGeneratorViewState extends State<FaColorsCodeGeneratorView> {
  int _currentStepIndex = 0;
  FaCreationType? _selectedType;
  FaTokenOption? _selectedBg;
  FaTokenOption? _selectedInk;
  FaTokenOption? _selectedStroke;

  FaTokenOption? _selectedShadow;
  double _shadowBlurRadius = 0.0;

  @override
  void initState() {
    super.initState();
  }

  /// Ordered registry governing layout pipeline steps metadata expanded to 6 comprehensive steps.
  static const List<_FaStepMetadata> _stepsLayout = [
    _FaStepMetadata(
      title: '1. Creation Type Select',
      description: 'Choose the global layout subsystem layer component rule.',
    ),
    _FaStepMetadata(
      title: '2. Background Canvas Fill',
      description:
          'Select an adaptive layout container or branded filling token asset.',
    ),
    _FaStepMetadata(
      title: '3. Content Typography Ink',
      description:
          'Select a highly accessible high-contrast content foreground ink token.',
    ),
    _FaStepMetadata(
      title: '4. Perimeter Outline Stroke',
      description:
          'Select a modular boundary demarcation outline stroke token asset.',
    ),
    _FaStepMetadata(
      title: '5. Volumetric Shadow Depth',
      description:
          'Select an isolated design token managing interface elevation density shadows.',
    ),
    _FaStepMetadata(
      title: '6. Shadow Blur Radius Control',
      description:
          'Adjust the mathematical spreading blur radius parameter manually.',
    ),
  ];

  void updateCode(String code) {}

  @override
  Widget build(BuildContext context) {
    final bool canRenderCodeBoard = _selectedType != null;

    return LeftRightContainer(
      fixedSizeWidth: 380,
      minSideWidth: 350,
      spacing: 16,
      start: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          _buildPipelineHeader(context),
          const SizedBox(height: 20),
          ...List.generate(
            _stepsLayout.length,
            (index) => _buildStepCard(context, index),
          ),
        ],
      ),
      end: _buildRightConsoleLayout(context, hasBaseType: canRenderCodeBoard),
    );
  }

  Widget _buildPipelineHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Architectural Token Compiler Pipeline',
          style: TextStyle(
            color: context.faColors.ink.primary,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Sequentially integrate isolated foundational graph nodes into production UI source patterns.',
          style: TextStyle(color: context.faColors.ink.secondary, fontSize: 12),
        ),
      ],
    );
  }

  Widget _buildStepCard(BuildContext context, int index) {
    final stepData = _stepsLayout[index];
    final isActive = _currentStepIndex == index;
    final colors = context.faColors;

    // We migrate color and borders directly onto the Material widget to act as the primary structural sheet
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(bottom: 12),
      // IMPORTANT: Use Material:
      child: Material(
        color: isActive ? colors.surface.subtle : colors.surface.standard,
        elevation: isActive ? 1 : 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(
            color: isActive ? colors.stroke.strong : colors.stroke.subtle,
            width: isActive ? 1.5 : 1.0,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: CircleAvatar(
                radius: 14,
                backgroundColor: isActive
                    ? colors.action.fill.primary
                    : colors.surface.muted,
                child: Text(
                  '${index + 1}',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: isActive
                        ? colors.action.ink.onPrimaryFill
                        : colors.ink.secondary,
                  ),
                ),
              ),
              title: Text(
                stepData.title,
                style: TextStyle(
                  color: colors.ink.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
              subtitle: Text(
                stepData.description,
                style: TextStyle(color: colors.ink.secondary, fontSize: 11),
              ),
              trailing: _getStepStatusIcon(context, index),
              onTap: () => setState(() => _currentStepIndex = index),
            ),

            if (isActive) ...[
              const Divider(height: 1),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: _buildTokenOptionsList(context, index),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildTokenOptionsList(BuildContext context, int stepIndex) {
    final colors = context.faColors;

    if (stepIndex == 0) {
      return Wrap(
        spacing: 8,
        runSpacing: 8,
        children: FaCreationType.values.map((type) {
          final isSelected = _selectedType == type;
          return ChoiceChip(
            label: Text(type.toString().split('.').last.toUpperCase()),
            selected: isSelected,
            onSelected: (selected) {
              if (selected) {
                setState(() {
                  _selectedType = type;
                  _selectedBg = null;
                  _selectedInk = null;
                  _selectedStroke = null;
                  _selectedShadow = null;
                  _currentStepIndex = 1;
                });
              }
            },
          );
        }).toList(),
      );
    }

    if (_selectedType == null) {
      return Text(
        'Please initialize a target context category in Step 1 first.',
        style: TextStyle(
          color: colors.ink.danger,
          fontSize: 11,
          fontStyle: FontStyle.italic,
        ),
      );
    }

    if (stepIndex == 5) {
      return Row(
        children: [
          Text(
            'blurRadius',
            style: TextStyle(
              fontFamily: 'Courier',
              fontSize: 12,
              color: colors.ink.secondary,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Slider(
              value: _shadowBlurRadius,
              min: 0.0,
              max: 20.0,
              divisions: 20,
              label: _shadowBlurRadius.toString(),
              activeColor: colors.action.fill.primary,
              onChanged: (val) => setState(() => _shadowBlurRadius = val),
            ),
          ),
          Text(
            _shadowBlurRadius.toStringAsFixed(1),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
              color: colors.ink.primary,
            ),
          ),
        ],
      );
    }

    List<FaTokenOption> dynamicOptions = [];
    if (stepIndex == 1) {
      dynamicOptions = FaTokenOptionsProvider.getBgOptions(
        context,
        _selectedType!,
      );
    } else if (stepIndex == 2) {
      final allInks = FaTokenOptionsProvider.getInkOptions(
        context,
        _selectedType!,
      );
      if (_selectedBg != null) {
        final bool requiredInkBoldState = !_selectedBg!.isBoldGroup;
        dynamicOptions = allInks
            .where((ink) => ink.isBoldGroup == requiredInkBoldState)
            .toList();
      } else {
        dynamicOptions = allInks;
      }
    } else if (stepIndex == 3) {
      dynamicOptions = FaTokenOptionsProvider.getStrokeOptions(
        context,
        _selectedType!,
      );
    } else if (stepIndex == 4) {
      dynamicOptions = FaTokenOptionsProvider.getShadowOptions(context);
    }

    return Column(
      children: dynamicOptions.map((option) {
        final bool isSelected =
            (stepIndex == 1 && _selectedBg == option) ||
            (stepIndex == 2 && _selectedInk == option) ||
            (stepIndex == 3 && _selectedStroke == option) ||
            (stepIndex == 4 && _selectedShadow == option);

        final Color previewColorSample =
            (stepIndex == 4 && option.tokenCode == 'Colors.transparent')
            ? Colors.transparent
            : _resolveTokenColorPrimitive(context, option.tokenCode);

        return AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          margin: const EdgeInsets.only(bottom: 6),
          // ✅ IMPORTANT: Use Material.
          child: Material(
            color: isSelected
                ? colors.action.fill.primaryTonal
                : Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(
                color: isSelected
                    ? colors.action.stroke.primary
                    : colors.stroke.subtle,
                width: isSelected ? 1.6 : 1.0,
              ),
            ),
            child: InkWell(
              onTap: () {
                setState(() {
                  if (stepIndex == 1) {
                    _selectedBg = option;
                    _selectedInk = null;
                    _currentStepIndex = 2;
                  } else if (stepIndex == 2) {
                    _selectedInk = option;
                    _currentStepIndex = 3;
                  } else if (stepIndex == 3) {
                    _selectedStroke = option;
                    final shadowOpts = FaTokenOptionsProvider.getShadowOptions(
                      context,
                    );
                    if (shadowOpts.isEmpty) {
                      _selectedShadow = null;
                      _currentStepIndex = 5;
                    } else {
                      _currentStepIndex = 4;
                    }
                  } else if (stepIndex == 4) {
                    _selectedShadow = option;
                    _currentStepIndex = 5;
                  }
                });
              },
              borderRadius: BorderRadius.circular(8),
              hoverColor: colors.action.fill.ghostBase.hover,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 12.0,
                ),
                child: Row(
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: previewColorSample,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: colors.divider.subtle,
                          width: 0.8,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            option.label,
                            style: TextStyle(
                              fontWeight: option.isBoldGroup
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              color: colors.ink.primary,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            option.tokenCode,
                            style: TextStyle(
                              fontFamily: 'Courier',
                              fontSize: 10,
                              color: colors.ink.secondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget? _getStepStatusIcon(BuildContext context, int index) {
    final colors = context.faColors;
    if (index == 0 && _selectedType != null) {
      return Icon(
        Icons.check_circle,
        color: colors.action.fill.success,
        size: 18,
      );
    }
    if (index == 1 && _selectedBg != null) {
      return Icon(
        Icons.check_circle,
        color: colors.action.fill.success,
        size: 18,
      );
    }
    if (index == 2 && _selectedInk != null) {
      return Icon(
        Icons.check_circle,
        color: colors.action.fill.success,
        size: 18,
      );
    }
    if (index == 3 && _selectedStroke != null) {
      return Icon(
        Icons.check_circle,
        color: colors.action.fill.success,
        size: 18,
      );
    }
    if (index == 4 && _selectedShadow != null) {
      return Icon(
        Icons.check_circle,
        color: colors.action.fill.success,
        size: 18,
      );
    }
    if (index == 5 && _shadowBlurRadius > 0) {
      return Icon(
        Icons.check_circle,
        color: colors.action.fill.success,
        size: 18,
      );
    }
    return null;
  }

  Widget _buildRightConsoleLayout(
    BuildContext context, {
    required bool hasBaseType,
  }) {
    final Color compiledBg = _selectedBg == null
        ? Colors.transparent
        : _resolveTokenColorPrimitive(context, _selectedBg!.tokenCode);

    final Color compiledInk = _selectedInk == null
        ? context.faColors.ink.primary
        : _resolveTokenColorPrimitive(context, _selectedInk!.tokenCode);

    final Color compiledStroke = _selectedStroke == null
        ? Colors.transparent
        : _resolveTokenColorPrimitive(context, _selectedStroke!.tokenCode);

    final Color compiledShadow =
        (_selectedShadow == null ||
            _selectedShadow!.tokenCode == 'Colors.transparent')
        ? Colors.transparent
        : _resolveTokenColorPrimitive(context, _selectedShadow!.tokenCode);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FaBlueprintConsole(
          selectedType: _selectedType,
          selectedBg: _selectedBg,
          selectedInk: _selectedInk,
          selectedStroke: _selectedStroke,
          selectedShadow: _selectedShadow,
          shadowBlurRadius: _shadowBlurRadius,
        ),
        const SizedBox(height: 16),
        Text(
          'Generated Live Blueprints & Output Code',
          style: TextStyle(
            color: context.faColors.ink.primary,
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
        ),
        const SizedBox(height: 12),
        Expanded(
          child: FaCodeAccordionBoard(
            selectedType: hasBaseType ? _selectedType : null,
            resolvedBg: compiledBg,
            resolvedInk: compiledInk,
            resolvedStroke: compiledStroke,
            resolvedShadow: compiledShadow,
            shadowBlurRadius: _shadowBlurRadius,
            bgToken: _selectedBg?.tokenCode ?? 'Colors.transparent',
            inkToken: _selectedInk?.tokenCode ?? 'context.faColors.ink.primary',
            strokeToken: _selectedStroke?.tokenCode ?? 'Colors.transparent',
            shadowToken: _selectedShadow?.tokenCode ?? 'Colors.transparent',
          ),
        ),
      ],
    );
  }

  Color _resolveTokenColorPrimitive(BuildContext context, String code) {
    if (code == 'Colors.transparent' || code.isEmpty) return Colors.transparent;
    final colors = context.faColors;
    final Map<String, FaNamespace> structuralNamespaceRegistry = {
      'faColors.action.fill': colors.action.fill,
      'faColors.action.ink': colors.action.ink,
      'faColors.action.stroke': colors.action.stroke,
      'faColors.action.shadow': colors.action.shadow,
      'faColors.surface': colors.surface,
      'faColors.ink': colors.ink,
      'faColors.divider': colors.divider,
      'faColors.bar': colors.bar,
      'faColors.input.fill': colors.input.fill,
      'faColors.input.stroke': colors.input.stroke,
      'faColors.input.ink': colors.input.ink,
      'faColors.shadow': colors.shadow,
      'faColors.common': colors.common,
    };

    final cleanCodePath = code.replaceFirst('context.', '');
    for (final entry in structuralNamespaceRegistry.entries) {
      if (cleanCodePath.startsWith(entry.key)) {
        final FaColor? matchingSmartColor = entry.value.findByTokenName(code);
        if (matchingSmartColor != null) return matchingSmartColor;
      }
    }
    return colors.surface.standard;
  }
}
