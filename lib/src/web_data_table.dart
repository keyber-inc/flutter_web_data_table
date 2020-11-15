import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'web_data_table_source.dart';

///
/// WebDataTable
///
class WebDataTable extends StatefulWidget {
  const WebDataTable({
    Key key,
    @required this.header,
    this.actions,
    this.sortColumnName,
    this.sortAscending = true,
    this.onSelectAll,
    this.dataRowHeight = kMinInteractiveDimension,
    this.headingRowHeight = 56.0,
    this.horizontalMargin = 24.0,
    this.columnSpacing = 56.0,
    this.showCheckboxColumn = false,
    this.initialFirstRowIndex = 0,
    this.onPageChanged,
    this.enableRowsPerPage = true,
    this.rowsPerPage = PaginatedDataTable.defaultRowsPerPage,
    this.availableRowsPerPage = const [
      PaginatedDataTable.defaultRowsPerPage,
      PaginatedDataTable.defaultRowsPerPage * 2,
      PaginatedDataTable.defaultRowsPerPage * 5,
      PaginatedDataTable.defaultRowsPerPage * 10,
    ],
    @required this.source,
    this.dragStartBehavior = DragStartBehavior.start,
  }) : super(key: key);

  final Widget header;
  final List<Widget> actions;
  final String sortColumnName;
  final bool sortAscending;
  final ValueSetter<bool> onSelectAll;
  final double dataRowHeight;
  final double headingRowHeight;
  final double horizontalMargin;
  final double columnSpacing;
  final bool showCheckboxColumn;
  final int initialFirstRowIndex;
  final ValueChanged<int> onPageChanged;
  final bool enableRowsPerPage;
  final int rowsPerPage;
  final List<int> availableRowsPerPage;
  final WebDataTableSource source;
  final DragStartBehavior dragStartBehavior;

  @override
  _WebDataTableState createState() => _WebDataTableState();
}

class _WebDataTableState extends State<WebDataTable> {
  int _sortColumnIndex;
  bool _sortAscending;
  int _rowsPerPage;

  @override
  void initState() {
    super.initState();
    _sortColumnIndex = _toSortColumnIndex(widget.source, widget.sortColumnName);
    _sortAscending = widget.sortAscending;
    _rowsPerPage = widget.rowsPerPage;
  }

  /// sortColumnName => sortColumnIndex
  int _toSortColumnIndex(
    WebDataTableSource source,
    String sortColumnName,
  ) {
    int index;
    if (sortColumnName != null) {
      source.columnConfigs.asMap().forEach((i, columnConfig) {
        if (columnConfig.name == sortColumnName) {
          index = i;
          return;
        }
      });
    }
    return index;
  }

  @override
  Widget build(BuildContext context) {
    return PaginatedDataTable(
      header: widget.header,
      actions: widget.actions,
      columns: widget.source.columnConfigs.map((config) {
        return DataColumn(
          label: config.label,
          tooltip: config.tooltip,
          numeric: config.numeric,
          onSort: config.sortable
              ? (columnIndex, ascending) {
                  widget.source.sort(columnIndex, ascending);
                  setState(() {
                    _sortColumnIndex = columnIndex;
                    _sortAscending = ascending;
                  });
                }
              : null,
        );
      }).toList(),
      sortColumnIndex: _sortColumnIndex,
      sortAscending: _sortAscending,
      onSelectAll: widget.onSelectAll,
      dataRowHeight: widget.dataRowHeight,
      headingRowHeight: widget.headingRowHeight,
      horizontalMargin: widget.horizontalMargin,
      columnSpacing: widget.columnSpacing,
      showCheckboxColumn: widget.showCheckboxColumn,
      initialFirstRowIndex: widget.initialFirstRowIndex,
      onPageChanged: widget.onPageChanged,
      rowsPerPage: _rowsPerPage,
      availableRowsPerPage: widget.availableRowsPerPage,
      onRowsPerPageChanged: widget.enableRowsPerPage
          ? (rowsPerPage) {
              setState(() {
                _rowsPerPage = rowsPerPage;
              });
            }
          : null,
      dragStartBehavior: widget.dragStartBehavior,
      source: widget.source,
    );
  }
}
