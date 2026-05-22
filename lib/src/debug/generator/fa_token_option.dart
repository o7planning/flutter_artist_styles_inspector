class FaTokenOption {
  final String label;
  final String description;
  final String tokenCode;

  /// true: Bold/Dark item, false: Subtle/Light/Transparent item.
  /// Used by the guardrail system to enforce contrast safety.
  final bool isBoldGroup;

  FaTokenOption({
    required this.label,
    required this.description,
    required this.tokenCode,
    required this.isBoldGroup,
  });
}
