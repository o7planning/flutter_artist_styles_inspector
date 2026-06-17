import 'package:flutter/material.dart';
import 'package:flutter_artist_markdown_widget/flutter_artist_markdown_widget.dart';
import 'package:flutter_artist_styles/flutter_artist_styles.dart';

import '../../../_endpoint.dart';

class OverviewTabContent extends StatelessWidget {
  final String langCode;

  const OverviewTabContent({required this.langCode, super.key});

  @override
  Widget build(BuildContext context) {
    final String overviewUrl = "$faColorsBaseURL/faColors-$langCode.md";

    return Container(
      color: context.faColors.surface.standard,
      child: FaMarkdownWidget.url(url: overviewUrl),
    );
  }
}
