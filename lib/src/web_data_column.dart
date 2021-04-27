import 'package:flutter/material.dart';

///
/// WebDataColumn
///
class WebDataColumn {
  const WebDataColumn({
    required this.name,
    required this.label,
    required this.dataCell,
    this.tooltip,
    this.numeric = false,
    this.sortable = true,
    this.comparable,
    this.filterText,
  });

  final String name;
  final Widget label;
  final DataCell Function(dynamic value) dataCell;
  final String? tooltip;
  final bool numeric;
  final bool sortable;
  final Comparable Function(dynamic value)? comparable;
  final String Function(dynamic value)? filterText;
}
