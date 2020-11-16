import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'src/web_data_table_source.dart';

export 'src/web_data_column.dart';
export 'src/web_data_table_source.dart';

///
/// WebDataTable
///
class WebDataTable extends StatefulWidget {
  const WebDataTable({
    Key key,
    @required this.header,
    this.actions,
    this.dataRowHeight = kMinInteractiveDimension,
    this.headingRowHeight = 56.0,
    this.horizontalMargin = 24.0,
    this.columnSpacing = 56.0,
    this.initialFirstRowIndex = 0,
    this.onPageChanged,
    this.enableRowsPerPage = true,
    this.rowsPerPage = defaultRowsPerPage,
    this.availableRowsPerPage = const [
      defaultRowsPerPage,
      defaultRowsPerPage * 2,
      defaultRowsPerPage * 5,
      defaultRowsPerPage * 10,
    ],
    @required this.source,
    this.dragStartBehavior = DragStartBehavior.start,
    this.enableSearch = false,
    this.searchDecoration,
    this.searchWidth = 200,
  }) : super(key: key);

  static const int defaultRowsPerPage = 10;
  final Widget header;
  final List<Widget> actions;
  final double dataRowHeight;
  final double headingRowHeight;
  final double horizontalMargin;
  final double columnSpacing;
  final int initialFirstRowIndex;
  final ValueChanged<int> onPageChanged;
  final bool enableRowsPerPage;
  final int rowsPerPage;
  final List<int> availableRowsPerPage;
  final WebDataTableSource source;
  final DragStartBehavior dragStartBehavior;
  final bool enableSearch;
  final InputDecoration searchDecoration;
  final double searchWidth;

  @override
  _WebDataTableState createState() => _WebDataTableState();
}

class _WebDataTableState extends State<WebDataTable> {
  int _sortColumnIndex;
  bool _sortAscending;
  int _rowsPerPage;
  String _searchText;
  bool _willSearch = true;
  Timer _timer;
  int _latestTick;

  @override
  void initState() {
    super.initState();
    _sortColumnIndex = widget.source.sortColumnIndex;
    _sortAscending = widget.source.sortAscending;
    _rowsPerPage = widget.rowsPerPage;
    if (widget.enableSearch) {
      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        if (!_willSearch) {
          if (_latestTick != null && timer.tick > _latestTick) {
            _willSearch = true;
          }
        }
        if (_willSearch) {
          _willSearch = false;
          _latestTick = null;
          setState(() {
            if (_searchText != null) {
              widget.source.search(_searchText);
            }
          });
        }
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    if (_timer != null) {
      _timer.cancel();
      _timer = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> actions = [];
    if (widget.enableSearch) {
      actions.add(Container(
        width: widget.searchWidth,
        child: TextField(
          decoration: widget.searchDecoration != null
              ? widget.searchDecoration
              : InputDecoration(
                  prefixIcon: Icon(Icons.search),
                ),
          onChanged: (text) {
            _searchText = text.trim();
            _willSearch = false;
            _latestTick = _timer.tick;
          },
        ),
      ));
    }
    if (widget.actions != null) {
      actions.addAll(widget.actions);
    }

    return PaginatedDataTable(
      header: widget.header,
      actions: actions,
      columns: widget.source.columns.map((config) {
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
      onSelectAll: (selected) => widget.source.selectAll(selected),
      dataRowHeight: widget.dataRowHeight,
      headingRowHeight: widget.headingRowHeight,
      horizontalMargin: widget.horizontalMargin,
      columnSpacing: widget.columnSpacing,
      showCheckboxColumn: widget.source.onSelectedRows != null,
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
