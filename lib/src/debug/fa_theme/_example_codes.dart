class FaExampleCodes {
  // --- Tab: Colors ---
  static const String colorsExample = '''
// Traditional way: 
final color = Theme.of(context).colorScheme.primary;

// faTokens way:
final color = context.faTokens.colors.primary;
final surface = context.faTokens.colors.surfaceContainerLow;''';

  // --- Tab: Typography ---
  static const String typographyExample = '''
// Traditional way: 
final style = Theme.of(context).textTheme.headlineLarge;

// faTokens way:
final style = context.faTokens.typography.headlineLarge;
// Hoặc sử dụng trực tiếp qua shortcut:
final body = context.faTokens.typography.bodyMedium;''';

  // --- Tab: Layout ---
  static const String layoutExample = '''
// Traditional way (Hardcoded): 
Container(width: 260);

// faTokens way:
Container(
  width: context.faTokens.layout.metrics.sidebarWidth,
  color: context.faTokens.layout.colors.sidebarSurface,
);''';

  // --- Tab: Components - Button ---
  static const String buttonExample = '''
// Traditional way (Hardcoded): 
ElevatedButton(
  style: ElevatedButton.styleFrom(minimumSize: Size(0, 40)),
  child: Text("Click"),
);

// faTokens way:
SizedBox(
  height: context.faTokens.components.button.height,
  child: FaButton(child: Text("Click")),
);''';

  // --- Tab: Components - Card ---
  static const String cardExample = '''
// Traditional way: 
Card(
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  child: Padding(padding: EdgeInsets.all(16), child: child),
);

// faTokens way:
FaCard(
  radius: context.faTokens.components.card.radius,
  padding: context.faTokens.components.card.padding,
  child: child,
);''';

  // --- Tab: Others - Radius ---
  static const String radiusExample = '''
// Traditional way: 
BorderRadius.circular(8.0);

// faTokens way:
BorderRadius.circular(context.faTokens.radius.md);''';

  // --- Tab: Others - Elevation ---
  static const String elevationExample = '''
// Traditional way: 
Material(elevation: 4.0);

// faTokens way:
Material(elevation: context.faTokens.elevation.level2);''';

  // --- Tab: Others - Motion ---
  static const String motionExample = '''
// Traditional way: 
AnimatedContainer(
  duration: Duration(milliseconds: 200),
  curve: Curves.easeOut,
);

// faTokens way:
AnimatedContainer(
  duration: context.faTokens.motion.normal,
  curve: context.faTokens.motion.standard,
);''';
}
