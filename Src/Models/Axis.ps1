# Axis — Encapsulates the object that represents an axis of chart.
class Axis : LinkElement {
    # Gets the .
    [Area]$Area
    # Represents if the value axis crosses the category axis between categories.
    [Nullable[bool]]$AxisBetweenCategories
    # Gets the appearance of an Axis.
    [Line]$AxisLine
    # Represents the base unit scale for the category axis.
    [string]$BaseUnitScale
    # Represents the category axis type.
    [string]$CategoryType
    # Represents the point on the value axis where the category axis crosses it.
    [Nullable[double]]$CrossAt
    # Represents the on the specified axis where the other axis crosses.
    [string]$CrossType
    # Represents the unit label for the specified axis.
    [string]$DisplayUnit
    # Represents a unit label on an axis in the specified chart. Unit labels are useful for charting large values— for example, in the millions or billions.
    [DisplayUnitLabel]$DisplayUnitLabel
    # Indicates whether the labels shall be shown as multi level.
    [Nullable[bool]]$HasMultiLevelLabels
    # Indicates whether the major unit of the axis is automatically assigned.
    [Nullable[bool]]$IsAutomaticMajorUnit
    # Indicates whether the max value is automatically assigned.
    [Nullable[bool]]$IsAutomaticMaxValue
    # Indicates whether the minor unit of the axis is automatically assigned.
    [Nullable[bool]]$IsAutomaticMinorUnit
    # Indicates whether the min value is automatically assigned.
    [Nullable[bool]]$IsAutomaticMinValue
    # Represents if the display unit label is shown on the specified axis.
    [Nullable[bool]]$IsDisplayUnitLabelShown
    # Represents if the value axis scale type is logarithmic or not.
    [Nullable[bool]]$IsLogarithmic
    # Represents if Microsoft Excel plots data points from last to first.
    [Nullable[bool]]$IsPlotOrderReversed
    # Represents if the axis is visible.
    [Nullable[bool]]$IsVisible
    # Represents the logarithmic base. Default value is 10.Only applies for Excel2007.
    [Nullable[double]]$LogBase
    # Represents major gridlines on a chart axis.
    [Line]$MajorGridLines
    # Represents the type of major tick mark for the specified axis.
    [string]$MajorTickMark
    # Represents the major units for the axis.
    [Nullable[double]]$MajorUnit
    # Represents the major unit scale for the category axis.
    [string]$MajorUnitScale
    # Represents the maximum value on the value axis.
    [Nullable[double]]$MaxValue
    # Represents minor gridlines on a chart axis.
    [Line]$MinorGridLines
    # Represents the type of minor tick mark for the specified axis.
    [string]$MinorTickMark
    # Represents the minor units for the axis.
    [Nullable[double]]$MinorUnit
    # Represents the major unit scale for the category axis.
    [string]$MinorUnitScale
    # Represents the minimum value on the value axis.
    [Nullable[double]]$MinValue
    # Represents the position of tick-mark labels on the specified axis.
    [string]$TickLabelPosition
    # Returns a object that represents the tick-mark labels for the specified axis.
    [TickLabels]$TickLabels
    # Represents the number of categories or series between tick-mark labels. Applies only to category and series axes.
    [Nullable[int32]]$TickLabelSpacing
    # Returns or sets the number of categories or series between tick marks. Applies only to category and series axes.
    [Nullable[int32]]$TickMarkSpacing
    # Gets the axis' title.
    [Title]$Title
}
