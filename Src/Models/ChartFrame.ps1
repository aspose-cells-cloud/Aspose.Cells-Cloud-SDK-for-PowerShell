# ChartFrame — Encapsulates the object that represents the frame object in a chart.
class ChartFrame {
    # Gets the area.
    [Area]$Area
    # True if the text in the object changes font size when the object size changes. The default value is True.
    [Nullable[bool]]$AutoScaleFont
    # Gets and sets the display mode of the background
    [string]$BackgroundMode
    # Gets the border.
    [Line]$Border
    # Gets a object of the specified ChartFrame object.
    [Font]$Font
    # Indicates whether the chart frame is automatic sized.
    [Nullable[bool]]$IsAutomaticSize
    # Indicates whether the size of the plot area size includes the tick marks, and the axis labels. False specifies that the size shall determine the size of the plot area, the tick marks, and the axis labels.
    [Nullable[bool]]$IsInnerMode
    # True if the frame has a shadow.
    [Nullable[bool]]$Shadow
    # Gets or sets the width of frame in units of 1/4000 of the chart area.
    [Nullable[int32]]$Width
    # Gets or sets the height of frame in units of 1/4000 of the chart area.
    [Nullable[int32]]$Height
    # Gets or sets the x coordinate of the upper left corner in units of 1/4000 of the chart area.
    [Nullable[int32]]$X
    # Gets or sets the y coordinate of the upper left corner in units of 1/4000 of the chart area.
    [Nullable[int32]]$Y
}
