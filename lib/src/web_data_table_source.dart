import 'package:flutter/material.dart';

import 'web_data_column.dart';

///
/// WebDataTableSource
///
class WebDataTableSource extends DataTableSource {
  WebDataTableSource({
    @required this.columns,
    @required this.rows,
    this.onTapRow,
    this.sortColumnName,
    this.sortAscending = true,
  }) {
    _rows = [...rows];
  }

  final List<WebDataColumn> columns;
  final List<Map<String, dynamic>> rows;
  List<Map<String, dynamic>> _rows;
  final Function(Map<String, dynamic> row, int index) onTapRow;
  String sortColumnName;
  bool sortAscending;

  @override
  DataRow getRow(int index) {
    List<DataCell> cells = [];
    for (final dataConfig in columns) {
      cells.add(dataConfig.dataCell(_rows[index][dataConfig.name]));
    }
    return DataRow.byIndex(
        index: index,
        cells: cells,
        onSelectChanged: (selected) {
          if (onTapRow != null) {
            onTapRow(_rows[index], index);
          }
        });
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _rows.length;

  @override
  int get selectedRowCount => 0;

  void sort(int columnIndex, bool ascending) {
    sortColumnName = columns[columnIndex].name;
    sortAscending = ascending;
    final cmp = columns[columnIndex].comparable;
    _rows.sort((Map<String, dynamic> a, Map<String, dynamic> b) {
      final aValue =
          cmp != null ? cmp(a[sortColumnName]) : a[sortColumnName].toString();
      final bValue =
          cmp != null ? cmp(b[sortColumnName]) : b[sortColumnName].toString();
      return ascending
          ? Comparable.compare(aValue, bValue)
          : Comparable.compare(bValue, aValue);
    });
    notifyListeners();
  }

  void search(String text) {
    if (text == null || text.length < 2) {
      _rows = [...rows];
      sort(sortColumnIndex, sortAscending);
      return;
    }

    _rows.clear();
    for (Map<String, dynamic> row in rows) {
      for (String name in row.keys.toList()) {
        final value = row[name].toString();
        if (value.contains(text)) {
          _rows.add(row);
          break;
        }
      }
    }
    sort(sortColumnIndex, sortAscending);
  }

  int get sortColumnIndex {
    int index;
    if (sortColumnName != null) {
      columns.asMap().forEach((i, columnConfig) {
        if (columnConfig.name == sortColumnName) {
          index = i;
          return;
        }
      });
    }
    return index;
  }
}
