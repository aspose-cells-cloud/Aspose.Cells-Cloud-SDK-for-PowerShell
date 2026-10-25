# ChartPoint — Represents a single point in a series in a chart.
class ChartPoint : LinkElement {
    # Gets the area.
    [Area]$Area
    # Gets the border.
    [Line]$Border
    # Returns a DataLabels object that represents the data label associated with the point.
    [DataLabels]$DataLabels
    # The distance of an open pie slice from the center of the pie chart is expressed as a percentage of the pie diameter.
    [Nullable[int32]]$Explosion
    # Gets the marker.
    [Marker]$Marker
    # True if the chartpoint has a shadow.
    [Nullable[bool]]$Shadow
    # Gets or sets the X value of the chart point.
    [object]$XValue
    # Gets or sets the Y value of the chart point.
    [object]$YValue
    # Gets or sets a value indicates whether this data points is in the second pie or bar on a pie of pie or bar of pie chart.
    [Nullable[bool]]$IsInSecondaryPlot
}
