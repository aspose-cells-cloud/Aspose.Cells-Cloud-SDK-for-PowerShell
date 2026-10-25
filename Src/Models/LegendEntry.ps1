# LegendEntry — Represents a legend entry in a chart legend.
class LegendEntry : LinkElement {
    # True if the text in the object changes font size when the object size changes. The default value is True.
    [Nullable[bool]]$AutoScaleFont
    # Gets and sets the display mode of the background
    [string]$BackgroundMode
    # Gets a object of the specified ChartFrame object.
    [Font]$Font
    # Gets and sets whether the legend entry is deleted.
    [Nullable[bool]]$IsDeleted
}
