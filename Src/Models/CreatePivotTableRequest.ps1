# CreatePivotTableRequest — Indicates create pivot table request
class CreatePivotTableRequest {
    # Pivot table name
    [string]$Name
    # The data for the new PivotTable cache.
    [string]$SourceData
    # The cell in the upper-left corner of the PivotTable report's destination range.
    [string]$DestCellName
    # Indicates whether using same data source when another existing pivot table has used this data source.If the property is true, it will save memory.
    [Nullable[bool]]$UseSameSource
    # Represents row fields in a PivotTable report.
    [int32[]]$PivotFieldRows
    # Represents column fields in a PivotTable report.
    [int32[]]$PivotFieldColumns
    # Represents data fields in a PivotTable report.
    [int32[]]$PivotFieldData
}
