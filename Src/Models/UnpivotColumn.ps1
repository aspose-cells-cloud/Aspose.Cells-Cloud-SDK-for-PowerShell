# UnpivotColumn — Unpivot column.
class UnpivotColumn {
    # Indicates unpivot column names.
    [string[]]$UnpivotColumnNames
    # Indicates the column is used to store the name of unpivot columns.
    [string]$ColumnMapName
    # Indicates the column is used to store the value of unpivot columns.
    [string]$ValueMapName
    [string]$AppliedOperateType
}
