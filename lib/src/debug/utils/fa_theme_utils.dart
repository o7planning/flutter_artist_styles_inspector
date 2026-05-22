import 'package:flutter/material.dart';

/// A utility class for theme-related color calculations and accessibility checks.
class FaThemeUtils {
  /// Determines if a color is "dark" based on its relative luminance.
  ///
  /// Returns [true] if the color is dark, suggesting a light foreground.
  /// Returns [false] if the color is light, suggesting a dark foreground.
  static bool isDark(Color color) => color.computeLuminance() < 0.5;

  /// Automatically returns a contrasting foreground color (White or Black)
  /// based on the provided [background] color.
  ///
  /// Useful for ensuring text/icons are always readable on dynamic surfaces.
  static Color getContrastColor(Color background) {
    return isDark(background) ? Colors.white : Colors.black87;
  }

  /// Calculates the contrast ratio between two colors to ensure WCAG compliance.
  ///
  /// Standards typically require a contrast ratio of at least 4.5:1
  /// for normal text to be considered accessible.
  static double getContrastRatio(Color color1, Color color2) {
    final double lum1 = color1.computeLuminance();
    final double lum2 = color2.computeLuminance();

    final double brightest = lum1 > lum2 ? lum1 : lum2;
    final double darkest = lum1 > lum2 ? lum2 : lum1;

    return (brightest + 0.05) / (darkest + 0.05);
  }

  /// Verifies if the contrast between [background] and [foreground]
  /// meets the minimum accessibility threshold (4.5:1).
  static bool hasSafeContrast(Color background, Color foreground) {
    return getContrastRatio(background, foreground) >= 4.5;
  }
}
