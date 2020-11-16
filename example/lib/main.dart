import 'package:flutter/material.dart';
import 'package:flutter_web_data_table/web_data_table.dart';

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
              header: Text('Sample Data'),
              actions: [
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {},
                ),
              ],
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
                  WebDataColumn(
                      name: 'dateTime',
                      label: const Text('DateTime'),
                      dataCell: (value) {
                        if (value is DateTime) {
                          final text =
                              '${value.year}/${value.month}/${value.day} ${value.hour}:${value.minute}:${value.second}';
                          return DataCell(Text(text));
                        }
                        return DataCell(Text(value.toString()));
                      },
                      searchText: (value) {
                        if (value is DateTime) {
                          return '${value.year}/${value.month}/${value.day} ${value.hour}:${value.minute}:${value.second}';
                        }
                        return value.toString();
                      }),
                ],
                rows: SampleData().data,
                onTapRow: (row, index) {
                  print('onTapRow(): index = $index, row = $row');
                },
                onSelectedRows: (rows) {
                  print(
                      'onSelectedRows(): count = ${rows.length} rows = ${rows.map((row) => row['id']).toList()}');
                },
                primaryKeyName: 'id',
              ),
              horizontalMargin: 100,
              enableSearch: true,
              searchDecoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'increment search...',
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFFCCCCCC),
                  ),
                ),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFFCCCCCC),
                  ),
                ),
              ),
              searchWidth: 300,
              onPageChanged: (offset) {
                print('onPageChanged(): offset = $offset');
              },
            ),
          ),
        ),
      ),
    );
  }
}
