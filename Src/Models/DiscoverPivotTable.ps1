# DiscoverPivotTable — Represents a pivot table, which is a pivot table created based on data analysis of a table.
class DiscoverPivotTable {
    # Represents pivot table name.
    [string]$Name
    # Represents pivot table title.
    [string]$Title
    # Represents pivot table data range.
    [string]$DataRange
    # Represents row fields in a PivotTable report.
    [int32[]]$PivotFieldRows
    # Represents column fields in a PivotTable report.
    [int32[]]$PivotFieldColumns
    # Represents data fields in a PivotTable report.
    [int32[]]$PivotFieldData
    # Represents pivot table thumbnail. Base64String
    [string]$Thumbnail
}
