# WorksheetDataStatistics — Represents worksheet data statistics.
class WorksheetDataStatistics {
    # Represents worksheet name.
    [string]$Name
    # Represents chart number.
    [Nullable[int32]]$ChartsCount
    # Represents list object number.
    [Nullable[int32]]$TablesCount
    # Represents pivot table number.
    [Nullable[int32]]$PivotTablesCount
    # Represents shape number.
    [Nullable[int32]]$ShapesCount
    # Represents shape number.
    [Nullable[int32]]$HyperlinksCount
    # Represents hyperlink number.
    [Nullable[int32]]$QueryTablesCount
    # Represents query table number.
    [Nullable[int32]]$CellsCount
    # Represents cell number.
    [Nullable[int32]]$CellsCountInTable
    # Represents formula number.
    [Nullable[int32]]$CellsCountIsFormula
}
