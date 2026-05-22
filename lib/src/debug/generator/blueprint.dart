import 'package:flutter/material.dart';
import 'package:flutter_artist_styles/flutter_artist_styles.dart';

import 'enums.dart';
import 'fa_token_option.dart';

/// Live reflecting instrumentation panel parsing and displaying compiler metric parameters.
class FaBlueprintConsole extends StatelessWidget {
  final FaCreationType? selectedType;
  final FaTokenOption? selectedBg;
  final FaTokenOption? selectedInk;
  final FaTokenOption? selectedStroke;
  final FaTokenOption? selectedShadow;
  final double shadowBlurRadius;

  const FaBlueprintConsole({
    super.key,
    required this.selectedType,
    required this.selectedBg,
    required this.selectedInk,
    required this.selectedStroke,
    required this.selectedShadow,
    required this.shadowBlurRadius,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.faColors;
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: colors.surface.standard,
        border: Border.all(color: colors.stroke.subtle),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildRow(
            'TYPE',
            selectedType?.toString().split('.').last.toUpperCase() ??
                'NOT SELECTED',
            context,
            selectedType == null,
          ),
          _buildRow(
            'BG',
            selectedBg == null
                ? 'NOT SELECTED'
                : '${selectedBg!.isBoldGroup ? "(Dark)" : "(Light)"}: ${selectedBg!.label}',
            context,
            selectedBg == null,
          ),
          _buildRow(
            'INK',
            selectedInk == null
                ? 'NOT SELECTED'
                : '${selectedInk!.isBoldGroup ? "(Dark)" : "(Light)"}: ${selectedInk!.label}',
            context,
            selectedInk == null,
          ),
          _buildRow(
            'STROKE',
            selectedStroke == null ? 'NOT SELECTED' : selectedStroke!.label,
            context,
            selectedStroke == null,
          ),
          _buildRow(
            'SHADOW',
            selectedShadow == null ? 'NOT SELECTED' : selectedShadow!.label,
            context,
            selectedShadow == null,
          ),
          _buildRow(
            'BLUR',
            '${shadowBlurRadius.toStringAsFixed(1)} dp',
            context,
            false,
          ),
        ],
      ),
    );
  }

  Widget _buildRow(
    String label,
    String value,
    BuildContext context,
    bool isNotSelected,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.bold,
            color: context.faColors.ink.secondary,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 11,
            fontFamily: 'monospace',
            color: isNotSelected
                ? context.faColors.ink.danger
                : context.faColors.action.ink.primary,
          ),
        ),
      ],
    );
  }
}
