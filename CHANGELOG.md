# CHANGELOG

## [2.0.4]

Use FaMarkdownWidget to show the document.

## [2.0.3]

Update Dependencies.

## 2.0.2

- **Fixed** an internal rendering exception where `ExpansionTile` and `ListTile` header interactive bounds within `FaCodeAccordionBoard` threw assertions due to ancestor `Container` background color decorations.
- **Refactored** layout nesting hierarchies across compiler preview panels, language selectors, and theme configuration dialogs by replacing intermediate raw `Container` boxes with native `Material` surface layers.
- **Restored** smooth Material 3 fluid ink splash ripples (`InkWell`) and dynamic touch response tracks, ensuring full compatibility with recent Flutter SDK layout pipeline enforcement rules.

## [2.0.1]

Add Example.

## [2.0.0+2]

Update Dependencies.

## [2.0.0+1]
 
Update Readme.md

## [2.0.0] - 2026-06-10 

Upgrade flutter_artist_styles to 2.0.0. 

## [1.0.0] - 2026-06-01

###  BREAKING CHANGES & MIGRATION GUIDE

To adapt to the reactive state architectural transformation introduced in `flutter_artist_styles` v1.0.0, the visual debugging layer has completely abandoned the static `selection` tab tracker pipeline.

All inspector dashboards and smart template code generators have been refactored to support **dynamic fluent method chaining** directly from core atomic color entities.

---

###  NEW FEATURES & VISUAL DEBUG UTILITIES

#### 1. Dynamic State Transformation Spectrum Matrix (`StateTabContent`)
Introduced a dedicated **State Evaluation Simulator** inside the inspector console view:
* Developers can now click any smart color token (`FaColor`) to instantly initialize the interactive **State** panel.
* Displays a real-time visual matrix mapping the full tint/shade color spectrum variations across 7 distinct interaction lifecycles:
  * `Normal (Idle State)`
  * `.hover` (Mouse proximity overlay)
  * `.pressed` (Touch/Click execution shift)
  * `.selected` (Multi-selection status focus)
  * `.current` (Focal element active record pointer)
  * `.dragged` (Viewport movement boundary)
  * `.disabled` (Read-only security structural lock)
* Features embedded absolute hex code readouts next to each adaptive state layer to ensure pixel-perfect cross-platform alignment validation.

#### 2. Advanced Layout Token Monitors (`SurfaceTabContent`)
The surface monitoring array now tracks explicit semantic enterprise layout definitions:
* Adds diagnostic pipelines to preview and verify structural grids powered by **`faColors.surface.row`** (Data Tables Layout) and **`faColors.surface.item`** (Repeating List/Grid View Canvas Layers).

#### 3. Smart Code Generation Stepping Board (`FaColorsCodeGeneratorView`)
The code generation wizard dialog has been upgraded to a 4-step programmatic compiling compiler workflow:
* **Step 1:** Select Core Component Intent Layout (`Action`, `Surface`, `Bar`).
* **Step 2:** Choose adaptive atomic Background token.
* **Step 3:** Choose perfectly paired contrast Foreground Ink token (Enforced via internal logic rules).
* **Step 4:** Choose complementary Stroke/Divider border boundary outline.
* Instantly yields ready-to-use production snippets (e.g., `TextButton.icon`, `ElevatedButton`, or customized data panels) complete with direct color state mappings.

#### 4. International Localization Support
The Inspector dialog now features an intuitive floating language quick-switch controller overlay:
* Supports fully localized structural guidelines and token technical logs in both English (`EN`) and Vietnamese (`VI`).

---

### ️ CODE CLEANUP & OPTIMIZATIONS

* **Davi Grid Caching Sync:** Refactored token tables using optimized performance rendering themes to mirror runtime theme updates cleanly without framework overhead.
* Fixed a text overlay render layout vulnerability inside the Markdown guide presentation compiler canvas.



## 0.9.3

* Update docs.

## 0.9.2

* **Core Rendering Engine Refactor (Multi-Platform Breakout)**
    * Completely removed the legacy HTML rendering architecture based on `flutter_widget_from_html` to eliminate native platform-blocking constraints.
    * Successfully migrated document presentation pipelines to a high-performance Markdown ecosystem using `markdown_widget`.
    * Fully unlocked native runtime execution verification across all 6 primary target environments (**Android, iOS, Web, Windows, macOS, Linux**), achieving a perfect 100% platform coverage compatibility rate.
* **Design Token Configuration Sync**
    * Fully synchronized the internal Markdown parser configurations with the primary `context.faColors` enterprise design tokens framework.
    * Remapped background containers, text headers (H1/H2/H3), layout borders, and dynamic table properties to automatically update layout bounds relative to active framework theme metrics.
* **Layout & Table Presentation Enhancements**
    * Integrated an enforced infinite bounding wrapper across data tables to guarantee word-wrapping containment and completely prevent horizontal scrolling breaks.
    * Adapted blockquote node styling properties to serve as unified error/warning text boundaries bounded by the semantic `colors.ink.danger` token.

## 0.9.1

* Initial release.
