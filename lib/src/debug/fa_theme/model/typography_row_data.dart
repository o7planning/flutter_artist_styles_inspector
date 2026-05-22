import 'package:flutter/material.dart';

class TypographyRowData {
  final String name;
  final TextStyle style;
  final bool isOverride;
  final TextStyle baseStyle;

  TypographyRowData({
    required this.name,
    required this.style,
    required this.isOverride,
    required this.baseStyle,
  });

  String getInfo(TextStyle s) {
    final double size = s.fontSize ?? 0.0;
    final sizeStr = size > 0 ? size.toStringAsFixed(1) : "Default";

    final weight = _convertWeight(s.fontWeight);
    final spacing = s.letterSpacing?.toStringAsFixed(2) ?? "0.00";

    String family = "System";
    if (s.fontFamily != null) {
      if (s.fontFamily!.contains("AppleSystem") ||
          s.fontFamily!.contains(".SF")) {
        family = "SF Pro (System)";
      } else if (s.fontFamily!.contains("Roboto")) {
        family = "Roboto";
      } else {
        family = s.fontFamily!;
      }
    }

    return "Size: $sizeStr • Weight: $weight • Spacing: $spacing • Family: $family";
  }

  String _convertWeight(FontWeight? w) {
    if (w == FontWeight.w400) return "w400";
    if (w == FontWeight.w700) return "w700";
    return w?.toString().split('.').last ?? "w400";
  }
}

class TypographyRowDataOLD {
  final String name;
  final TextStyle style;
  final bool isOverride;
  final TextStyle baseStyle;

  TypographyRowDataOLD({
    required this.name,
    required this.style,
    required this.isOverride,
    required this.baseStyle,
  });

  String get fontSize =>
      (style.fontSize ?? baseStyle.fontSize ?? 14.0).toStringAsFixed(1);

  String get fontWeight => _getWeightName(
    style.fontWeight ?? baseStyle.fontWeight ?? FontWeight.normal,
  );

  String get letterSpacing =>
      (style.letterSpacing ?? baseStyle.letterSpacing ?? 0.0).toStringAsFixed(
        2,
      );

  String get fontFamily => style.fontFamily ?? baseStyle.fontFamily ?? 'System';

  String get lineHeight =>
      (style.height ?? baseStyle.height ?? 1.0).toStringAsFixed(2);

  String _getWeightName(FontWeight weight) {
    if (weight == FontWeight.w400) return "Regular (400)";
    if (weight == FontWeight.w500) return "Medium (500)";
    if (weight == FontWeight.w700) return "Bold (700)";
    if (weight == FontWeight.w300) return "Light (300)";
    return weight.toString().replaceAll("FontWeight.", "");
  }
}
