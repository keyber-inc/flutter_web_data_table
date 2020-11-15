import 'package:flutter/material.dart';
import 'package:flutter_web_data_table/flutter_web_data_table.dart';

import 'sample_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('WebDataTable Sample'),
        ),
        body: WebDataTable(
          sortAscending: false,
          sortColumnName: 'browser',
          header: Text('DataTables Advanced Tables'),
          source: WebDataTableSource(
            columnConfigs: [
              WebColumnConfig(
                name: 'renderingEngine',
                label: Text('Rendering engine'),
                dataCell: (value) => DataCell(Text('$value')),
              ),
              WebColumnConfig(
                name: 'browser',
                label: Text('Browser'),
                dataCell: (value) => DataCell(Text('$value')),
              ),
              WebColumnConfig(
                name: 'platform',
                label: Text('Platform(s)'),
                dataCell: (value) => DataCell(Text('$value')),
              ),
              WebColumnConfig(
                name: 'engineVersion',
                label: Text('Engine version'),
                dataCell: (value) => DataCell(Text('$value')),
              ),
              WebColumnConfig(
                name: 'cssGrade',
                label: Text('CSS grade'),
                dataCell: (value) => DataCell(Text('$value')),
                sortable: false,
              ),
            ],
            rows: SampleData().data,
            onTapRow: (row, index) {
              print('$index: $row');
            },
          ),
          horizontalMargin: 100,
        ),
      ),
    );
  }
}
