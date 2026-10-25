# Series — Encapsulates the object that represents a single data series in a chart.
class Series : LinkElement {
    # Represents the background area of Series object.
    [Area]$Area
    # Gets or sets the 3D shape type used with the 3-D bar or column chart.
    [string]$Bar3DShapeType
    # Represents border of Series object.
    [Line]$Border
    # Gets or sets the scale factor for bubbles in the specified chart group. It can be an integer value from 0 (zero) to 300, corresponding to a percentage of the default size. Applies only to bubble charts.
    [Nullable[int32]]$BubbleScale
    # Gets or sets the bubble sizes values of the chart series.
    [string]$BubbleSizes
    # Gets the number of the data values.
    [Nullable[int32]]$CountOfDataValues
    # Represents the DataLabels object for the specified ASeries.
    [DataLabels]$DataLabels
    # Gets the series's name that displays on the chart graph.
    [string]$DisplayName
    # Returns or sets the size of the hole in a doughnut chart group. The hole size is expressed as a percentage of the chart size, between 10 and 90 percent.
    [Nullable[int32]]$DoughnutHoleSize
    # Returns a object that represents the down bars on a line chart. Applies only to line charts.
    [DropBars]$DownBars
    # Returns a object that represents the drop lines for a series on the line chart or area chart. Applies only to line chart or area charts.
    [Line]$DropLines
    # The distance of an open pie slice from the center of the pie chart is expressed as a percentage of the pie diameter.
    [Nullable[int32]]$Explosion
    # Gets or sets the angle of the first pie-chart or doughnut-chart slice, in degrees (clockwise from vertical). Applies only to pie, 3-D pie, and doughnut charts, 0 to 360.
    [Nullable[int32]]$FirstSliceAngle
    # Returns or sets the space between bar or column clusters, as a percentage of the bar or column width. The value of this property must be between 0 and 500.
    [Nullable[int32]]$GapWidth
    # True if the series has a three-dimensional appearance. Applies only to bubble charts.
    [Nullable[bool]]$Has3DEffect
    # True if the chart has drop lines. Applies only to line chart or area charts.
    [Nullable[bool]]$HasDropLines
    # True if the line chart has high-low lines. Applies only to line charts.
    [Nullable[bool]]$HasHiLoLines
    # True if the series has leader lines.
    [Nullable[bool]]$HasLeaderLines
    # True if a radar chart has category axis labels. Applies only to radar charts.
    [Nullable[bool]]$HasRadarAxisLabels
    # True if a stacked column chart or bar chart has series lines or if a Pie of Pie chart or Bar of Pie chart has connector lines between the two sections. Applies only to stacked column charts, bar charts, Pie of Pie charts, or Bar of Pie charts.
    [Nullable[bool]]$HasSeriesLines
    # True if a line chart has up and down bars. Applies only to line charts.
    [Nullable[bool]]$HasUpDownBars
    # Returns a HiLoLines object that represents the high-low lines for a series on a line chart. Applies only to line charts.
    [Line]$HiLoLines
    # Indicates whether the threshold value is automatic.
    [Nullable[bool]]$IsAutoSplit
    # Represents if the color of points is varied. The chart must contain only one series.
    [Nullable[bool]]$IsColorVaried
    # Represents leader lines on a chart. Leader lines connect data labels to data points. This object isn’t a collection; there’s no object that represents a single leader line.
    [Line]$LeaderLines
    # Gets the legend entry according to this series.
    [LegendEntry]$LegendEntry
    # Gets the marker.
    [Marker]$Marker
    # Gets or sets the name of the data series.
    [string]$Name
    # Specifies how bars and columns are positioned. Can be a value between – 100 and 100. Applies only to 2-D bar and 2-D column charts.
    [Nullable[int32]]$Overlap
    # Indicates if this series is plotted on second value axis.
    [Nullable[bool]]$PlotOnSecondAxis
    # Gets the collection of points in a series in a chart.
    [LinkElement]$Points
    # Returns or sets the size of the secondary section of either a pie of pie chart or a bar of pie chart, as a percentage of the size of the primary pie. Can be a value from 5 to 200.
    [Nullable[int32]]$SecondPlotSize
    # Returns a SeriesLines object that represents the series lines for a stacked bar chart or a stacked column chart. Applies only to stacked bar and stacked column charts.
    [Line]$SeriesLines
    # True if the series has a shadow.
    [Nullable[bool]]$Shadow
    # True if negative bubbles are shown for the chart group. Valid only for bubble charts.
    [Nullable[bool]]$ShowNegativeBubbles
    # Gets or sets what the bubble size represents on a bubble chart.
    [string]$SizeRepresents
    # Represents curve smoothing. True if curve smoothing is turned on for the line chart or scatter chart. Applies only to line and scatter connected by lines charts.
    [Nullable[bool]]$Smooth
    # Returns or sets a value that how to determine which data points are in the second pie or bar on a pie of pie or bar of pie chart.
    [string]$SplitType
    # Returns or sets a value that shall be used to determine which data points are in the second pie or bar on a pie of pie or bar of pie chart.
    [Nullable[double]]$SplitValue
    # Returns an object that represents a collection of all the trendlines for the series.
    [Trendlines]$TrendLines
    # Gets or sets a data series' type.
    [string]$Type
    # Returns an DropBars object that represents the up bars on a line chart. Applies only to line charts.
    [DropBars]$UpBars
    # Represents the data of the chart series.
    [string]$Values
    # Represents X direction error bar of the series.
    [ErrorBar]$XErrorBar
    # Represents the x values of the chart series.
    [string]$XValues
    # Represents Y direction error bar of the series.
    [ErrorBar]$YErrorBar
}
