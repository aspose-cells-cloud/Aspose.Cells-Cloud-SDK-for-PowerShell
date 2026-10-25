# Legend — Encapsulates the object that represents the chart legend.
class Legend : ChartFrame {
    # Gets or sets the legend position type.
    [string]$Position
    # Gets a collection of all the LegendEntry objects in the specified chart legend. Setting the legend entries of the surface chart is not supported. So it will return null if the chart type is surface chart type.
    [LinkElement]$LegendEntries
}
