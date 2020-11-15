import 'package:flutter/material.dart';

import 'web_column_config.dart';

///
/// WebDataTableSource
///
class WebDataTableSource extends DataTableSource {
  WebDataTableSource({
    @required this.columnConfigs,
    @required this.rows,
    this.onTapRow,
  });

  final List<WebColumnConfig> columnConfigs;
  final List<Map<String, dynamic>> rows;
  final Function(Map<String, dynamic> row, int index) onTapRow;

  @override
  DataRow getRow(int index) {
    List<DataCell> cells = [];
    for (final dataConfig in columnConfigs) {
      cells.add(dataConfig.dataCell(rows[index][dataConfig.name]));
    }
    return DataRow.byIndex(
        index: index,
        cells: cells,
        onSelectChanged: (selected) {
          if (onTapRow != null) {
            onTapRow(rows[index], index);
          }
        });
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => rows.length;

  @override
  int get selectedRowCount => 0;

  void sort(int columnIndex, bool ascending) {
    final name = columnConfigs[columnIndex].name;
    final cmp = columnConfigs[columnIndex].comparable;
    rows.sort((Map<String, dynamic> a, Map<String, dynamic> b) {
      final aValue = cmp != null ? cmp(a[name]) : a[name].toString();
      final bValue = cmp != null ? cmp(b[name]) : b[name].toString();
      return ascending
          ? Comparable.compare(aValue, bValue)
          : Comparable.compare(bValue, aValue);
    });
    notifyListeners();
  }
}
