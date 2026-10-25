# PivotColumn — Represents pivot column for data table.
class PivotColumn {
    # Represents pivot column name.
    [string]$PivotColumnName
    # Represents column name that sets the column's value to the value of the pivot column.
    [string[]]$ValueColumnNames
    [string]$AppliedOperateType
}
