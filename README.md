# flutter_web_data_table

A DataTable for Flutter Web that is implemented a sorting, text filtering and selecting.

## Usage

Using `WebDataTable` is similar to `PaginatedDataTable`.

### Sorting

1. set `WebDataTableSource().sortColumnName` and `WebDataTableSource().sortAscending`
2. implements `WebDataTable().onSort`
3. each `WebDataColumn().sortable` to true

### Text Filtering

1. set `WebDataTableSource().filterTexts`

### Selecting

1. set `WebDataTableSource().primaryKeyName`
2. implements `WebDataTableSource().onSelectRows`
