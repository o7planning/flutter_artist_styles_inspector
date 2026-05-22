import 'package:davi/davi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_artist_styles/flutter_artist_styles.dart';

DaviThemeData getDemoDaviTableThemeData(
  BuildContext context, {
  required int currentItemIndex,
  List<int> selectedItemIndexes = const [],
}) {
  return DaviThemeData(
    columnDividerThickness: 0.4,
    columnDividerFillHeight: true,
    decoration: BoxDecoration(
      border: Border.all(width: 0.2, color: context.faColors.divider.subtle),
      color: context.faColors.surface.ground,
    ),
    header: HeaderThemeData(
      color: context.faColors.bar.standard,
      bottomBorderColor: context.faColors.divider.strong,
    ),
    headerCell: HeaderCellThemeData(
      padding: const EdgeInsets.all(5),
      height: 35,
      textStyle: TextStyle(
        color: context.faColors.ink.label,
        fontWeight: FontWeight.bold,
        fontSize: 12,
      ),
    ),
    row: RowThemeData(
      dividerThickness: 0.4,
      dividerColor: context.faColors.divider.subtle,
      fillHeight: true,
      color: (int row) {
        if (row == currentItemIndex) {
          return context.faColors.surface.row.current;
        }
        if (selectedItemIndexes.contains(row)) {
          return context.faColors.surface.row.selected;
        }
        return null;
      },
      hoverBackground: (int row) => context.faColors.surface.row.hover,
    ),
    cell: CellThemeData(
      padding: const EdgeInsets.all(5),
      contentHeight: 32,
      textStyle: TextStyle(color: context.faColors.ink.primary, fontSize: 13),
    ),
    scrollbar: TableScrollbarThemeData(
      thickness: 8,
      radius: const Radius.circular(4),
      thumbColor: context.faColors.action.fill.tertiaryQuiet,
    ),
  );
}
