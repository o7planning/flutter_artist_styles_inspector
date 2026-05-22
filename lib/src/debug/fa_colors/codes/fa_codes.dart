class FaCodes {
  static const String primaryBtn = """
ElevatedButton(
  style: ElevatedButton.styleFrom(
    backgroundColor: context.faColors.action.fill.primary,
    foregroundColor: context.faColors.action.ink.primary,
  ),
  onPressed: () {},
  child: const Text("Primary Action"),
)
""";

  static const String secondaryBtn = """
OutlinedButton(
  style: OutlinedButton.styleFrom(
    foregroundColor: context.faColors.action.ink.primary,
    side: BorderSide(color: context.faColors.action.stroke.primary, width: 0.8),
  ),
  onPressed: () {},
  child: const Text("Secondary"),
)
""";

  static const String sampleChip = """
// Contributor/User Chip
Container(
  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
  decoration: BoxDecoration(
    color: context.faColors.action.fill.primary.selected,
    borderRadius: BorderRadius.circular(20),
    border: Border.all(color: context.faColors.action.stroke.primary),
  ),
  child: Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(Icons.person, size: 14, color: context.faColors.action.ink.primary),
      SizedBox(width: 6),
      Text("Selected Chip", style: TextStyle(color: context.faColors.action.ink.primary, fontWeight: FontWeight.bold)),
    ],
  ),
)
""";

  static const String softBadge = """
// Soft Badge (For use with light status labels)
Container(
  decoration: BoxDecoration(
    color: context.faColors.action.fill.selected,
    borderRadius: BorderRadius.circular(4),
  ),
  child: Text("BADGE", style: TextStyle(color: context.faColors.action.ink.primary)),
)
""";

  static const String techHighlight = """
// Technical/Highlight Square
Container(
  color: context.faColors.action.fill.highlight,
  child: Icon(Icons.bolt, color: context.faColors.action.ink.highlight),
)
""";

  static const String dangerBtn = """
ElevatedButton(
  style: ElevatedButton.styleFrom(
    backgroundColor: context.faColors.action.fill.danger,
    foregroundColor: context.faColors.action.ink.onDangerFill,
  ),
  onPressed: () {},
  child: const Text("Delete Account"),
)
""";

  static const String errorBtn = """
ElevatedButton(
  style: ElevatedButton.styleFrom(
    backgroundColor: context.faColors.action.fill.error,
    foregroundColor: context.faColors.action.ink.onErrorFill,
  ),
  onPressed: () {},
  child: const Text("Delete Account"),
)
""";

  static const String ghostBtn = """
TextButton(
  style: TextButton.styleFrom(
    foregroundColor: context.faColors.action.ink.primary,
  ),
  child: const Text("Cancel"),
)
""";

  // --- TAB 3: SURFACE & BAR ---
  static const String surfaceBase = """
Container(
  color: context.faColors.surface.ground,
  child: const Text('Scaffold Base Layer'),
)
""";

  static const String barPrimary = """
Container(
  height: 48,
  color: context.faColors.bar.standard,
  child: const Center(child: Text('Navigation Header')),
)""";

  // --- TAB 4: TYPOGRAPHY ---
  static const String textPrimary = """
Text(
  'Headline Title',
  style: TextStyle(
    color: context.faColors.ink.primary,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  ),
)
""";

  static String get inputUsage => "TODO";
}
