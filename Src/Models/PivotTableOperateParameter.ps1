# PivotTableOperateParameter — Represents pivot table operate parameter.
class PivotTableOperateParameter : OperateParameter {
    # Represents source data of pivot table.
    [string]$SourceData
    # Represents start cell name of the pivot table.
    [string]$DestCellName
    # Represents table name of pivot table.
    [string]$TableName
    # Represents whether the same source is used.
    [Nullable[bool]]$UseSameSource
    # Represents pivot table index.
    [Nullable[int32]]$PivotTableIndex
    # Represents pivot row fields.
    [int32[]]$PivotFieldRows
    # Represents pivot column fields.
    [int32[]]$PivotFieldColumns
    # Represents pivot data field.
    [int32[]]$PivotFieldData
}
