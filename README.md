# flutter_web_data_table

A DataTable for Flutter Web that is implemented a sort and search.

## Usage

Using `WebDataTable` is similar to `PaginatedDataTable`.

### Sorting

By default sorting is enabled.

If you want to disable sorting, set `sortable` of `WebDataColumn` to false.

### Searching

By default searching is disabled.

If you want to enable searching, set `enableSearch` of `WebDataTable` to true.

### Selecting

If you want to selecting, implements `onSelectedRows` of `WebDataTableSource` and set `primaryKeyName` to primary key.