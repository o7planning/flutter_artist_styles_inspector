import 'package:davi/davi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_artist_styles/flutter_artist_styles.dart';

import '../_build_helper.dart';
import '../utils/davi_table_utils.dart';

class FaColorCodeTable extends StatefulWidget {
  final List<MapEntry<String, FaColor>> data;
  final String tokenHeaderName;
  final ValueChanged<MapEntry<String, FaColor>>? onRowTap;

  const FaColorCodeTable({
    super.key,
    required this.data,
    this.tokenHeaderName = 'Token',
    this.onRowTap,
  });

  @override
  State<FaColorCodeTable> createState() => _FaColorCodeTableState();
}

class _FaColorCodeTableState extends State<FaColorCodeTable> {
  final ScrollController _controller = ScrollController();

  /// Stores the currently selected color token entry to maintain state
  MapEntry<String, FaColor>? _selectedEntry;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final model = DaviModel<MapEntry<String, FaColor>>(
      rows: widget.data,
      columns: [
        DaviColumn(
          name: widget.tokenHeaderName,
          cellValue: (row) => row.data.key,
          grow: 1,
        ),
        DaviColumn(
          name: 'Preview',
          width: 60,
          headerAlignment: Alignment.center,
          cellAlignment: Alignment.center,
          resizable: false,
          cellWidget: (params) => Tooltip(
            message: "context.${params.data.key}",
            child: buildColorPreview(params.data.value),
          ),
        ),
        DaviColumn(
          name: 'Hex',
          headerAlignment: Alignment.centerLeft,
          cellAlignment: Alignment.center,
          width: 110,
          resizable: false,
          cellWidget: (params) => buildHexCell(
            context,
            '#${params.data.value.toARGB32().toRadixString(16).toUpperCase()}',
          ),
        ),
      ],
    );
    int currentItemIndex = _selectedEntry == null
        ? -1
        : widget.data.indexOf(_selectedEntry!);
    return DaviTheme(
      data: getDemoDaviTableThemeData(
        context,
        currentItemIndex: currentItemIndex,
      ),
      child: Material(
        type: MaterialType.transparency,
        child: Davi<MapEntry<String, FaColor>>(
          verticalScrollController: _controller,
          model,
          onRowTap: (row) {
            if (widget.onRowTap != null) {
              widget.onRowTap!(row);
              setState(() {
                _selectedEntry = row;
              });
            }
          },
        ),
      ),
    );
  }
}
