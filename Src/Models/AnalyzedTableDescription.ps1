# AnalyzedTableDescription — Represents analyzed table description.
class AnalyzedTableDescription {
    # Represents table name.
    [string]$Name
    # Represents worksheet name which is where the table is located.
    [string]$SheetName
    # Represents analyzed description about table columns.
    [AnalyzedColumnDescription[]]$Columns
    # Represents date columns list.
    [int32[]]$DateColumns
    # Represents number columns list.
    [int32[]]$NumberColumns
    # Represents string columns list.
    [int32[]]$TextColumns
    # Represents exception columns list.
    [int32[]]$ExceptionColumns
    # Represents there is a table header in the table.
    [Nullable[bool]]$HasTableHeaderRow
    # Represents there is a total row in the table.
    [Nullable[bool]]$HasTableTotalRow
    # Represents the column index as the start data column.
    [Nullable[int32]]$StartDataColumnIndex
    # Represents the column index as the end data column.
    [Nullable[int32]]$EndDataColumnIndex
    # Represents the row index as the start data row.
    [Nullable[int32]]$StartDataRowIndex
    # Represents the row index as the end data row.
    [Nullable[int32]]$EndDataRowIndex
    # Represents table thumbnail. Base64String
    [string]$Thumbnail
    # Represents a collection of charts, which is a collection of charts created based on data analysis of a table.
    [DiscoverChart[]]$DiscoverCharts
    # Represents a collection of pivot tables, which is a collection of pivot tables created based on data analysis of a table.
    [DiscoverPivotTable[]]$DiscoverPivotTables
}
