import 'package:flutter/material.dart';
import 'package:flutter_artist_styles/flutter_artist_styles.dart';
import 'package:flutter_artist_styles_inspector/flutter_artist_styles_inspector.dart';

void main() {
  runApp(const MyApp());
}

/// The foundational MaterialApp layout tracking the global FlutterArtist engine setup.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Styles Inspector Minimal Workspace',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, brightness: Brightness.light),
      darkTheme: ThemeData(useMaterial3: true, brightness: Brightness.dark),
      // Automatically hooks into the design system theme pipeline
      home: const StyleShowcasePage(),
    );
  }
}

/// A minimalist interactive canvas designed to instantly showcase core theme tokens
/// and launch the runtime visual asset analyzer.
class StyleShowcasePage extends StatefulWidget {
  const StyleShowcasePage({super.key});

  @override
  State<StyleShowcasePage> createState() => _StyleShowcasePageState();
}

class _StyleShowcasePageState extends State<StyleShowcasePage> {
  bool _isItemToggled = false;
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.faColors.surface.ground,
      appBar: AppBar(
        title: const Text('FlutterArtist Styles Showcase'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.analytics_outlined),
            tooltip: 'Open Inspector HUD',
            onPressed: () => FaColorsInspectorDialog.show(context),
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 400),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                /// ─── VISUAL BLOCK 1: DYNAMIC STATE CONTAINER ───
                MouseRegion(
                  onEnter: (_) => setState(() => _isHovered = true),
                  onExit: (_) => setState(() => _isHovered = false),
                  child: GestureDetector(
                    onTap: () =>
                        setState(() => _isItemToggled = !_isItemToggled),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.all(24.0),
                      decoration: BoxDecoration(
                        color: _isItemToggled
                            ? context.faColors.surface.row.selected
                            : (_isHovered
                                  ? context.faColors.surface.row.hover
                                  : context.faColors.surface.row),
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(
                          color: _isHovered
                              ? context.faColors.stroke.strong
                              : Colors.transparent,
                          width: 2,
                        ),
                      ),
                      child: Column(
                        children: [
                          Text(
                            _isItemToggled
                                ? 'STATE: SELECTED (TOGGLED)'
                                : 'STATE: IDLE / HOVERABLE',
                            style: TextStyle(
                              color: _isItemToggled
                                  ? context.faColors.ink.row.selected
                                  : context.faColors.ink.row,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Click me to toggle selection state. Hover to update bounds dynamically.',
                            style: TextStyle(
                              color: context.faColors.ink.tertiary,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                /// ─── VISUAL BLOCK 2: SYSTEM ACTION CONTROLS ───
                FilledButton.icon(
                  onPressed: () {},
                  style: FilledButton.styleFrom(
                    backgroundColor: context.faColors.action.fill.primary,
                    foregroundColor: context.faColors.action.ink.onPrimaryFill,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  icon: const Icon(Icons.bolt, size: 18),
                  label: const Text('Primary Execution Anchor'),
                ),
                const SizedBox(height: 12),

                /// ─── VISUAL BLOCK 3:
                OutlinedButton.icon(
                  onPressed: () => FaColorsInspectorDialog.show(context),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: context.faColors.stroke.medium),
                    foregroundColor: context.faColors.ink.primary,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  icon: const Icon(Icons.explore_outlined, size: 18),
                  label: const Text(
                    'Open Styles Inspector HUD',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
