import 'package:flutter/material.dart';
import 'package:flutter_artist_commons_ui/flutter_artist_commons_ui.dart';
import 'package:flutter_artist_styles/flutter_artist_styles.dart';

import 'debug/generator/code_generator_view.dart';

class FaColorsGeneratorDialog extends StatelessWidget {
  const FaColorsGeneratorDialog({super.key});

  static Future<dynamic> show(BuildContext context) {
    return showDialog(
      context: context,
      builder: (_) => const FaColorsGeneratorDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FaDialog(
      backgroundColor: context.faColors.surface.standard,
      titleText: 'FaColors Code Generator',
      contentPadding: EdgeInsets.all(5),
      preferredContentWidth: 1000,
      preferredContentHeight: 600,
      content: FaColorsCodeGeneratorView(langCode: 'en'),
    );
  }
}
