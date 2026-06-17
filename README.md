
# flutter_artist_styles_inspector

The official companion visual debugging and smart code generation toolkit for the **FlutterArtist Ecosystem**.

This package embeds production-grade runtime inspectors and interactive code wizards directly into your application layout layer. It empowers development teams to instantly trace dynamic token spectrum shifts, ensure strict WCAG contrast compliance, and emit clean structural component layouts automatically.

[LIVE DEMO](https://o7planning.github.io/demo/flutter/flutter_artist_styles_demo/)

[Download Demo Source Code](https://github.com/o7planning/flutter_artist_styles_demo)

![faColors,action](https://o7planning.github.io/docs/flutter/flutter_artist_styles_inspector/images/fa-colors-action.gif)

![faColors Code Generator](https://o7planning.github.io/docs/flutter/flutter_artist_styles_inspector/images/fa-colors-code-generator.gif)

---

##  Key Features

* **Interactive State Spectrum Simulator (`StateTabContent`):** Allows you to select any core token instance and visually analyze its color transformation matrix across 7 operational micro-interaction states (`Normal`, `.hover`, `.pressed`, `.selected`, `.current`, `.dragged`, and `.disabled`) complete with real-time precise absolute hex output readouts.
* **Semantic Layout Tracker Grid:** Built-in dashboard modules designed to inspect, trace, and validate dedicated enterprise grid layers powered by `faColors.surface.row` and `faColors.surface.item` layouts.
* **Guaranteed Contrast Guardrails:** Hardcoded logic validations embedded within the compiler board wizard that automatically group and enforce compliant color pairs (e.g., matching dark/light background fills with readable contrast layout inks) to permanently eliminate styling production bugs.
* **Multi-Step Programmatic Blueprint Board:** A highly intuitive 4-step wizard module interface (`Creation Type` -> `Background` -> `Foreground` -> `Border`) driven by `LeftRightContainer` to seamlessly compile tailored structural component templates on the fly.
* **One-Click Clipboard Manifest Sync:** Integrated responsive preview cards mapped side-by-side with persistent source code text regions for rapid snippet duplication into your project workspace.
* **On-The-Fly Localization Support:** Features an optional floating language selector quick-switch overlay, delivering comprehensive documentation and technical trace logs in both English (`EN`) and Vietnamese (`VI`).

---

## ️ Installation

Add this development dependency configuration to your target project's `pubspec.yaml` manifest file:

```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_artist_styles: ^2.1.0
  flutter_artist_styles_inspector: ^2.0.4
```

---

##  Core API & Presentation Triggers

Mounting the graphical inspector dialogue interfaces requires only a single, explicit semantic execution line. You can safely bind these triggers to a hidden debug action bar button, a custom gesture callback loop, or an administrative control portal.

### 1. Show the Code Generator Dialog Workspace Only

Launches an isolated modal panel focused strictly on the 4-step component compilation stepping board:

```dart
import 'package:flutter/material.dart';
import 'package:flutter_artist_styles_inspector/flutter_artist_styles_inspector.dart';

void openLiveCodeGenerator(BuildContext context) {
  // Launches the standalone stepping board view
  FaColorsGeneratorDialog.show(context);
}

```

### 2. Show the All-in-One Comprehensive Terminal Workspace

Launches the full debugging cockpit interface, housing the localized general metadata tab, token grid indexes, typography/layout parameter monitors, the interaction state simulator, and the embedded code generation subsystem:

```dart
import 'package:flutter/material.dart';
import 'package:flutter_artist_styles_inspector/flutter_artist_styles_inspector.dart';

void openComprehensiveCoreInspector(BuildContext context) {
  // Launches the full multi-tab diagnostic console
  FaColorsInspectorDialog.show(context);
}

```

---

##  Interactive Layout Previews

### Token Context Layout Validation Tracker

Inspect active structural variables, preview semantic sub-namespace graphs (`ink`, `action`, `surface`, `bar`, `stroke`, `divider`, `input`), and analyze localized translation guides instantly.

### Multi-Step Live Blueprint Generator Board

Enforce your exact design specifications, select perfectly matched text tokens, review live material rendering behaviors, and copy raw responsive layout recipes directly into your production repository codebase.
 