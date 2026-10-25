# GlobalizationSettings — Represents the globalization settings.
class GlobalizationSettings {
    # Gets or sets the globalization settings for Chart.
    [ChartGlobalizationSettings]$ChartSettings
    # Gets or sets the globalization settings for pivot table.
    [PivotGlobalizationSettings]$PivotSettings
    # Gets the separator for list, parameters of function, ...etc.
    [string]$ListSeparator
    # Gets the separator for rows in array data in formula.
    [string]$RowSeparatorOfFormulaArray
    # Gets the separator for the items in array's row data in formula.
    [string]$ColumnSeparatorOfFormulaArray
}
