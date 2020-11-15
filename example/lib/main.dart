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
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(8.0),
            child: WebDataTable(
              header: Text('DataTables Advanced Tables'),
              source: WebDataTableSource(
                sortAscending: false,
                sortColumnName: 'browser',
                columns: [
                  WebDataColumn(
                    name: 'renderingEngine',
                    label: const Text('Rendering engine'),
                    dataCell: (value) => DataCell(Text('$value')),
                  ),
                  WebDataColumn(
                    name: 'browser',
                    label: const Text('Browser'),
                    dataCell: (value) => DataCell(Text('$value')),
                  ),
                  WebDataColumn(
                    name: 'platform',
                    label: const Text('Platform(s)'),
                    dataCell: (value) => DataCell(Text('$value')),
                  ),
                  WebDataColumn(
                    name: 'engineVersion',
                    label: const Text('Engine version'),
                    dataCell: (value) => DataCell(Text('$value')),
                  ),
                  WebDataColumn(
                    name: 'cssGrade',
                    label: const Text('CSS grade'),
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
              enableSearch: true,
            ),
          ),
        ),
      ),
    );
  }
}
