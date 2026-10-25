# ColorFilter — Color filter.
class ColorFilter {
    # Whether filter by the cell's fill color.
    [Nullable[bool]]$FilterByFillColor
    # A property "Pattern" of type string with a getter and setter is defined.
    [string]$Pattern
    [CellsColor]$Color
    [CellsColor]$ForegroundColorColor
    [CellsColor]$BackgroundColor
}
