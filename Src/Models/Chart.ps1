# Chart — Encapsulates the object that represents a single Excel chart.
class Chart : LinkElement {
    # True if Microsoft Excel scales a 3-D chart so that it's closer in size to the equivalent 2-D chart. The RightAngleAxes property must be True.
    [Nullable[bool]]$AutoScaling
    # Returns a object that represents the back wall of a 3-D chart.
    [Walls]$BackWall
    # Gets the chart's X axis.
    [Axis]$CategoryAxis
    # Gets the chart area in the worksheet.
    [ChartArea]$ChartArea
    # Represents the chart data table.
    [ChartDataTable]$ChartDataTable
    # Represents the chartShape;
    [LinkElement]$ChartObject
    # Represents the depth of a 3-D chart as a percentage of the chart width (between 20 and 2000 percent).
    [Nullable[int32]]$DepthPercent
    # Represents the elevation of the 3-D chart view, in degrees.
    [Nullable[int32]]$Elevation
    # Gets or sets the angle of the first pie-chart or doughnut-chart slice, in degrees (clockwise from vertical). Applies only to pie, 3-D pie, and doughnut charts, 0 to 360.
    [Nullable[int32]]$FirstSliceAngle
    # Returns a object that represents the walls of a 3-D chart.
    [Floor]$Floor
    # Gets or sets the distance between the data series in a 3-D chart, as a percentage of the marker width. The value of this property must be between 0 and 500.
    [Nullable[int32]]$GapDepth
    # Returns or sets the space between bar or column clusters, as a percentage of the bar or column width. The value of this property must be between 0 and 500.
    [Nullable[int32]]$GapWidth
    # Returns or sets the height of a 3-D chart as a percentage of the chart width (between 5 and 500 percent).
    [Nullable[int32]]$HeightPercent
    # Indicates whether hide the pivot chart field buttons only when the chart is PivotChart.
    [Nullable[bool]]$HidePivotFieldButtons
    # Indicates whether the chart is a 3d chart.
    [Nullable[bool]]$Is3D
    # Gets or sets a value indicating whether the chart area is rectangular cornered. Default is true.
    [Nullable[bool]]$IsRectangularCornered
    # Gets the chart legend.
    [Legend]$Legend
    # Represents chart name.
    [string]$Name
    # Gets a collection representing the data series in the chart.
    [SeriesItems]$NSeries
    # Represents the page setup description in this chart.
    [LinkElement]$PageSetup
    # Returns or sets the perspective for the 3-D chart view. Must be between 0 and 100. This property is ignored if the RightAngleAxes property is True.
    [Nullable[int32]]$Perspective
    # The source is the data of the pivotTable. If PivotSource is not empty ,the chart is PivotChart.
    [string]$PivotSource
    # Represents the way the chart is attached to the cells below it.
    [string]$Placement
    # Gets the chart's plot area which includes axis tick labels.
    [PlotArea]$PlotArea
    # Gets and sets how to plot the empty cells.
    [string]$PlotEmptyCellsType
    # Indicates whether only plot visible cells.
    [Nullable[bool]]$PlotVisibleCells
    # Gets and sets the printed chart size.
    [string]$PrintSize
    # True if the chart axes are at right angles. Applies only for 3-D charts(except Column3D and 3-D Pie Charts).
    [Nullable[bool]]$RightAngleAxes
    # Represents the rotation of the 3-D chart view (the rotation of the plot area around the z-axis, in degrees).
    [Nullable[int32]]$RotationAngle
    # Gets the chart's second X axis.
    [LinkElement]$SecondCategoryAxis
    # Gets the chart's second Y axis.
    [LinkElement]$SecondValueAxis
    # Gets the chart's series axis.
    [LinkElement]$SeriesAxis
    # Returns all drawing shapes in this chart.
    [LinkElement]$Shapes
    # Gets or sets a value indicating whether the chart displays a data table.
    [Nullable[bool]]$ShowDataTable
    # Gets or sets a value indicating whether the chart legend will be displayed. Default is true.
    [Nullable[bool]]$ShowLegend
    # Returns a object that represents the side wall of a 3-D chart.
    [LinkElement]$SideWall
    # True if Microsoft Excel resizes the chart to match the size of the chart sheet window.
    [Nullable[bool]]$SizeWithWindow
    # Gets and sets the builtin style.
    [Nullable[int32]]$Style
    # Represents chart title.
    [LinkElement]$Title
    # Represents chart type.
    [string]$Type
    # Gets the chart's Y axis.
    [Axis]$ValueAxis
    # Returns a object that represents the walls of a 3-D chart.
    [LinkElement]$Walls
    # True if gridlines are drawn two-dimensionally on a 3-D chart.
    [Nullable[bool]]$WallsAndGridlines2D
}
