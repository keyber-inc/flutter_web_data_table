# flutter_web_data_table

A DataTable for Flutter Web that is implemented a sorting, text filtering and selecting.

<img width=100% alt="example.gif" src="https://user-images.githubusercontent.com/13707135/116309117-52976380-a7e3-11eb-8e19-19a55f0543ea.gif">

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
