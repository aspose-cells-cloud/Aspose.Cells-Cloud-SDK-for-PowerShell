# Walls — Encapsulates the object that represents the walls of a 3-D chart.
class Walls : Floor {
    # Gets the x coordinate of the left-bottom corner of Wall center in units of 1/4000 of chart's width after calls Chart.Calculate() method.
    [Nullable[int32]]$CenterX
    # Gets the y coordinate of the left-bottom corner of Wall center in units of 1/4000 of chart's height after calls Chart.Calculate() method.
    [Nullable[int32]]$CenterY
    # Gets the depth front to back in units of 1/4000 of chart's width after calls Chart.Calculate() method.
    [Nullable[int32]]$Depth
    # Gets the height of top to bottom in units of 1/4000 of chart's height after calls Chart.Calculate() method.
    [Nullable[int32]]$Height
    # Gets the width of left to right in units of 1/4000 of chart's width after calls Chart.Calculate() method.
    [Nullable[int32]]$Width
    [Color]$BackgroundColor
    [FillFormat]$FillFormat
    [Color]$ForegroundColor
    [string]$Format
    [Nullable[bool]]$InvertIfNegative
    [Nullable[double]]$Transparency
}
