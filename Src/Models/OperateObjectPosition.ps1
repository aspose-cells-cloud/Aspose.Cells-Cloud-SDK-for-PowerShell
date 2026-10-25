# OperateObjectPosition — Represents operate object position.
class OperateObjectPosition {
    # Represents data source of operate object.
    [DataSource]$DataSource
    # Represents data source of operate object.
    [FileSource]$Workbook
    # Represents worksheet name of operate object.
    [string]$SheetName
    # Represents chart index of operate object.
    [Nullable[int32]]$ChartIndex
    # Represents shape index of operate object.
    [Nullable[int32]]$ShapeIndex
    # Represents cell name of operate object.
    [string]$CellName
    # Represents list object index of operate object.
    [Nullable[int32]]$ListObjectIndex
}
