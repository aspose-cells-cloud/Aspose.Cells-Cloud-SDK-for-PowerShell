# ChartDataTable — Represents a chart data table.
class ChartDataTable : LinkElement {
    # True if the text in the object changes font size when the object size changes. The default value is True.
    [Nullable[bool]]$AutoScaleFont
    # Gets and sets the display mode of the background
    [string]$BackgroundMode
    # Returns a Border object that represents the border of the object
    [Line]$Border
    # Gets a object which represents the font setting of the specified chart data table.
    [Font]$Font
    # True if the chart data table has horizontal cell borders
    [Nullable[bool]]$HasBorderHorizontal
    # True if the chart data table has outline borders
    [Nullable[bool]]$HasBorderOutline
    # True if the chart data table has vertical cell borders
    [Nullable[bool]]$HasBorderVertical
    # True if the data label legend key is visible.
    [Nullable[bool]]$ShowLegendKey
}
