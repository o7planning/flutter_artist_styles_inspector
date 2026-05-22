import 'package:flutter/material.dart';
import 'package:flutter_artist_styles/flutter_artist_styles.dart';

import 'enums.dart';
import 'fa_token_option.dart';

/// Dynamic options generator provider that replaces historical high-maintenance
/// hardcoded token option map registries using pure runtime self-reflection data filters.
class FaTokenOptionsProvider {
  /// Dynamically compiles background color choices driven by the active layout category.
  static List<FaTokenOption> getBgOptions(
    BuildContext context,
    FaCreationType type,
  ) {
    final colors = context.faColors;

    switch (type) {
      case FaCreationType.action:
        // Returns the static transparent placeholder alongside the fully unrolled action list
        return [
          FaTokenOption(
            label: 'Not Set',
            description: 'Transparent base overlay canvas',
            tokenCode: 'Colors.transparent',
            isBoldGroup: false,
          ),
          ...colors.action.fill.allTokens.map(
            (faColor) => _mapToOption(faColor, categoryPrefix: 'Fill'),
          ),
        ];

      case FaCreationType.surface:
        return colors.surface.allTokens
            .map((faColor) => _mapToOption(faColor, categoryPrefix: 'Surface'))
            .toList();

      case FaCreationType.bar:
        return colors.bar.allTokens
            .map((faColor) => _mapToOption(faColor, categoryPrefix: 'Bar'))
            .toList();
    }
  }

  /// Dynamically compiles foreground text/icon ink choices driven by the active layout category.
  static List<FaTokenOption> getInkOptions(
    BuildContext context,
    FaCreationType type,
  ) {
    final colors = context.faColors;

    switch (type) {
      case FaCreationType.action:
        return colors.action.ink.allTokens
            .map((faColor) => _mapToOption(faColor, categoryPrefix: 'Ink'))
            .toList();

      case FaCreationType.surface:
        return colors.ink.allTokens
            .map((faColor) => _mapToOption(faColor, categoryPrefix: 'Ink'))
            .toList();

      case FaCreationType.bar:
        //  UNLOCKED: Đưa thanh Bar về chuẩn tương phản giống Surface thay vì hardcode 1 token duy nhất
        return colors.ink.allTokens
            .map((faColor) => _mapToOption(faColor, categoryPrefix: 'Ink'))
            .toList();
    }
  }

  /// Dynamically compiles border outline stroke choices driven by the active layout category.
  static List<FaTokenOption> getStrokeOptions(
    BuildContext context,
    FaCreationType type,
  ) {
    final colors = context.faColors;

    switch (type) {
      case FaCreationType.action:
        return colors.action.stroke.allTokens
            .map((faColor) => _mapToOption(faColor, categoryPrefix: 'Stroke'))
            .toList();

      case FaCreationType.surface:
        return colors.stroke.allTokens
            .map((faColor) => _mapToOption(faColor, categoryPrefix: 'Stroke'))
            .toList();

      case FaCreationType.bar:
        // Bars aggregate standard divider lines alongside layout strokes natively
        return [
          FaTokenOption(
            label: 'Stroke: subtle',
            description: 'Thin minimal separation boundary accent line',
            tokenCode: 'context.faColors.divider.subtle',
            isBoldGroup: false,
          ),
          _mapToOption(colors.stroke.medium, categoryPrefix: 'Stroke'),
          _mapToOption(colors.stroke.strong, categoryPrefix: 'Stroke'),
        ];
    }
  }

  /// Dynamically compiles volumetric shadow layer choices driven by the application context.
  static List<FaTokenOption> getShadowOptions(BuildContext context) {
    return [
      FaTokenOption(
        label: 'Shadow: none',
        description: 'No shadow: completely flat structural layout surface.',
        tokenCode: 'Colors.transparent',
        isBoldGroup: false,
      ),
      ...context.faColors.action.shadow.allTokens.map(
        (faColor) => FaTokenOption(
          label: 'Shadow: ${faColor.tokenShortName}',
          description:
              faColor.description ??
              'System managed volumetric shadow primitive.',
          tokenCode: faColor.tokenFullName,
          isBoldGroup: false,
        ),
      ),
    ];
  }

  /// Helper factory projecting an immutable internal [FaColor] entity into a lightweight presentation option wrapper.
  static FaTokenOption _mapToOption(
    FaColor color, {
    required String categoryPrefix,
  }) {
    return FaTokenOption(
      label: '$categoryPrefix: ${color.tokenShortName}',
      description:
          color.description ?? 'System managed design token primitive asset.',
      tokenCode: color.tokenFullName,
      isBoldGroup: color.isBold,
    );
  }
}
