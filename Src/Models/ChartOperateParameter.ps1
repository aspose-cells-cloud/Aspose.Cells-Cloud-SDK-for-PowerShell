# ChartOperateParameter — Represents chart operate parameter.
class ChartOperateParameter : OperateParameter {
    # Represents chart index.
    [Nullable[int32]]$ChartIndex
    # Represents chart type.
    [string]$ChartType
    # Represents upper left row index of chart.
    [Nullable[int32]]$UpperLeftRow
    # Represents upper left column index of chart.
    [Nullable[int32]]$UpperLeftColumn
    # Represents lower right row index of chart.
    [Nullable[int32]]$LowerRightRow
    # Represents lower right column index of chart.
    [Nullable[int32]]$LowerRightColumn
    # Represents chart area.
    [string]$Area
    # Represents whether to plot the series from a range of cell values by row or by column.
    [Nullable[bool]]$IsVertical
    # Represents chart category data.
    [string]$CategoryData
    # Represents whether auto get serial name.
    [Nullable[bool]]$IsAutoGetSerialName
    # Represents chart title.
    [string]$Title
}
