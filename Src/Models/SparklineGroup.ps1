# SparklineGroup — is organized into sparkline group. A SparklineGroup contains a variable number of sparkline items. A sparkline group specifies the type, display settings and axis settings for the sparklines.
class SparklineGroup {
    # Indicates whether to show data in hidden rows and columns.
    [Nullable[bool]]$DisplayHidden
    # Gets and sets the color of the first point of data in the sparkline group.
    [CellsColor]$FirstPointColor
    # Gets and sets the color of the highest points of data in the sparkline group.
    [CellsColor]$HighPointColor
    # Gets and sets the color of the horizontal axis in the sparkline group.
    [CellsColor]$HorizontalAxisColor
    # Represents the range that contains the date values for the sparkline data.
    [string]$HorizontalAxisDateRange
    # Gets and sets the color of the last point of data in the sparkline group.
    [CellsColor]$LastPointColor
    # Gets and sets the line weight in each line sparkline in the sparkline group, in the unit of points.
    [Nullable[double]]$LineWeight
    # Gets and sets the color of the lowest points of data in the sparkline group.
    [CellsColor]$LowPointColor
    # Gets and sets the color of points in each line sparkline in the sparkline group.
    [CellsColor]$MarkersColor
    # Gets and sets the color of the negative values on the sparkline group.
    [CellsColor]$NegativePointsColor
    # Indicates how to plot empty cells.
    [string]$PlotEmptyCellsType
    # Indicates whether the plot data is right to left.
    [Nullable[bool]]$PlotRightToLeft
    # Gets and sets the preset style type of the sparkline group.
    [string]$PresetStyle
    # Gets and sets the color of the sparklines in the sparkline group.
    [CellsColor]$SeriesColor
    # Indicates whether to highlight the first point of data in the sparkline group.
    [Nullable[bool]]$ShowFirstPoint
    # Indicates whether to highlight the highest points of data in the sparkline group.
    [Nullable[bool]]$ShowHighPoint
    # Indicates whether to show the sparkline horizontal axis. The horizontal axis appears if the sparkline has data that crosses the zero axis.
    [Nullable[bool]]$ShowHorizontalAxis
    # Indicates whether to highlight the last point of data in the sparkline group.
    [Nullable[bool]]$ShowLastPoint
    # Indicates whether to highlight the lowest points of data in the sparkline group.
    [Nullable[bool]]$ShowLowPoint
    # Indicates whether to highlight each point in each line sparkline in the sparkline group.
    [Nullable[bool]]$ShowMarkers
    # Indicates whether to highlight the negative values on the sparkline group with a different color or marker.
    [Nullable[bool]]$ShowNegativePoints
    # Gets the collection of object.
    [Sparkline[]]$SparklineCollection
    # Indicates the sparkline type of the sparkline group.
    [string]$Type
    # Gets and sets the custom maximum value for the vertical axis.
    [Nullable[double]]$VerticalAxisMaxValue
    # Represents the vertical axis maximum value type.
    [string]$VerticalAxisMaxValueType
    # Gets and sets the custom minimum value for the vertical axis.
    [Nullable[double]]$VerticalAxisMinValue
    # Represents the vertical axis minimum value type.
    [string]$VerticalAxisMinValueType
}
