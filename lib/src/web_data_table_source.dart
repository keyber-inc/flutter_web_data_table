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
    this.onSelectedRows,
    this.sortColumnName,
    this.sortAscending = true,
    this.primaryKeyName,
  }) {
    if (onSelectedRows != null) {
      assert(primaryKeyName != null);
    }
    _rows = [...rows];
    if (sortColumnName != null) {
      sort(sortColumnIndex, sortAscending);
    }
  }

  final List<WebDataColumn> columns;
  final List<Map<String, dynamic>> rows;
  List<Map<String, dynamic>> _rows;
  final List<String> _selectedRows = [];
  final Function(Map<String, dynamic> row, int index) onTapRow;
  final Function(List<Map<String, dynamic>> selectedRows) onSelectedRows;
  String sortColumnName;
  bool sortAscending;
  final String primaryKeyName;

  @override
  DataRow getRow(int index) {
    List<DataCell> cells = [];
    for (final dataConfig in columns) {
      cells.add(dataConfig.dataCell(_rows[index][dataConfig.name]));
    }
    return DataRow.byIndex(
        index: index,
        cells: cells,
        selected:
            _selectedRows.contains(_rows[index][primaryKeyName].toString()),
        onSelectChanged: (selected) {
          if (selected) {
            _selectedRows.add(_rows[index][primaryKeyName].toString());
          } else {
            _selectedRows.remove(_rows[index][primaryKeyName].toString());
          }
          if (onTapRow != null) {
            onTapRow(_rows[index], index);
          }
          if (onSelectedRows != null) {
            onSelectedRows(_selectedRows.map((key) => _findRow(key)).toList());
          }
          notifyListeners();
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
      if (_rows.length != rows.length) {
        _rows = [...rows];
        sort(sortColumnIndex, sortAscending);
      }
      return;
    }

    _rows.clear();
    for (Map<String, dynamic> row in rows) {
      for (String name in row.keys.toList()) {
        final column = _findDataColumn(name);
        String searchText = row[name].toString();
        if (column?.searchText != null) {
          searchText = column.searchText(row[name]);
        }
        if (searchText.contains(text)) {
          _rows.add(row);
          break;
        }
      }
    }
    sort(sortColumnIndex, sortAscending);
  }

  WebDataColumn _findDataColumn(String name) {
    for (WebDataColumn column in columns) {
      if (column.name == name) {
        return column;
      }
    }
    return null;
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

  void selectAll(bool selected) {
    _selectedRows.clear();
    if (selected) {
      _selectedRows
          .addAll(_rows.map((row) => row[primaryKeyName].toString()).toList());
    }

    if (onSelectedRows != null) {
      onSelectedRows(_selectedRows.map((key) => _findRow(key)).toList());
    }
    notifyListeners();
  }

  Map<String, dynamic> _findRow(String key) {
    for (Map<String, dynamic> row in rows) {
      if (row[primaryKeyName] == key) {
        return row;
      }
    }
    return null;
  }
}
