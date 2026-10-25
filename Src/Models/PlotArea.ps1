# PlotArea — Encapsulates the object that represents the plot area in a chart.
class PlotArea : ChartFrame {
    # Gets or sets the height of plot area in units of 1/4000 of the chart area.
    [Nullable[int32]]$InnerHeight
    # Gets or sets the width of plot area in units of 1/4000 of the chart area.
    [Nullable[int32]]$InnerWidth
    # Gets or gets the x coordinate of the upper top corner of plot area in units of 1/4000 of the chart area.
    [Nullable[int32]]$InnerX
    # Gets or gets the x coordinate of the upper top corner of plot area in units of 1/4000 of the chart area.
    [Nullable[int32]]$InnerY
}
