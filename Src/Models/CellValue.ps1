# CellValue — Represents the cell value and corresponding type.
class CellValue {
    # A public integer property called "rowIndex" with both getter and setter.
    [Nullable[int32]]$RowIndex
    [Nullable[int32]]$ColumnIndex
    [string]$Type
    [string]$Value
    [string]$Formula
    [Style]$Style
}
