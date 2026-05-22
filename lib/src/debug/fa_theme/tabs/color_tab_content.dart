import 'package:davi/davi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_artist_styles/flutter_artist_styles.dart';

import '../../_build_helper.dart';
import '../../utils/davi_table_utils.dart';

class ColorTabContent extends StatefulWidget {
  const ColorTabContent({super.key});

  @override
  State<ColorTabContent> createState() => _ColorTabContentState();
}

class _ColorTabContentState extends State<ColorTabContent> {
  late DaviModel<DebugColorRowData> _model;

  @override
  void initState() {
    super.initState();
    _refreshModel();
  }

  void _refreshModel() {
    FaTheme faTheme = FaThemeHub.instance.getCurrentTheme();

    final ColorScheme baseScheme = ColorScheme.fromSeed(
      seedColor: faTheme.seedColor,
      brightness: faTheme.brightness,
    );
    final List<DebugColorRowData> rows = faTheme.debugColorRowDatas(baseScheme);

    _model = DaviModel<DebugColorRowData>(
      rows: rows,
      columns: [
        DaviColumn(
          name: 'Property Name',
          cellValue: (row) => "colorScheme.${row.data.tokenName}",
          grow: 2,
          width: 200,
        ),
        DaviColumn(
          name: 'Seed Color',
          width: 90,
          cellWidget: (params) =>
              buildColorPreview(params.data.seedGeneratedColor),
        ),
        DaviColumn(
          name: 'Seed Hex',
          width: 110,
          cellWidget: (params) => buildHexCell(context, params.data.seedHex),
        ),
        DaviColumn(
          name: 'Override Color',
          width: 100,
          cellWidget: (params) => params.data.overrideColor != null
              ? buildColorPreview(params.data.overrideColor!)
              : const Center(child: Text("")),
        ),
        DaviColumn(
          name: 'Override Hex',
          width: 110,
          cellWidget: (params) => params.data.overrideHex != '---'
              ? buildHexCell(context, params.data.overrideHex)
              : const Center(child: Text("")),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return DaviTheme(
      data: getDemoDaviTableThemeData(context, currentItemIndex: -1),
      child: Davi<DebugColorRowData>(_model),
    );
  }
}
