# SqlScriptSaveOptions
class SqlScriptSaveOptions : SaveOptions {
    [Nullable[bool]]$CheckIfTableExists
    [string]$ColumnTypeMap
    [Nullable[bool]]$CheckAllDataForColumnType
    [Nullable[bool]]$AddBlankLineBetweenRows
    [string]$Separator
    [string]$OperatorType
    [Nullable[int32]]$PrimaryKey
    [Nullable[bool]]$CreateTable
    [string]$IdName
    [Nullable[int32]]$StartId
    [string]$TableName
    [Nullable[bool]]$ExportAsString
    [CellArea]$ExportArea
    [Nullable[bool]]$HasHeaderRow
}
