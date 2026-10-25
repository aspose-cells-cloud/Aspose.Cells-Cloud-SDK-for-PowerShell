# Trendline — Represents a trendline in a chart.
class Trendline : Line {
    # The class has a property named "link" of type "Link" that can be accessed and modified.
    [Link]$Link
    # Returns or sets the number of periods (or units on a scatter chart) that the trendline extends backward. The number of periods must be greater than or equal to zero. If the chart type is column ,the number of periods must be between 0 and 0.5
    [Nullable[double]]$Backward
    # Represents the DataLabels object for the specified series.
    [DataLabels]$DataLabels
    # Represents if the equation for the trendline is displayed on the chart (in the same data label as the R-squared value). Setting this property to True automatically turns on data labels.
    [Nullable[bool]]$DisplayEquation
    # Represents if the R-squared value of the trendline is displayed on the chart (in the same data label as the equation). Setting this property to True automatically turns on data labels.
    [Nullable[bool]]$DisplayRSquared
    # Returns or sets the number of periods (or units on a scatter chart) that the trendline extends forward. The number of periods must be greater than or equal to zero.
    [Nullable[double]]$Forward
    # Returns or sets the point where the trendline crosses the value axis.
    [Nullable[double]]$Intercept
    # Returns if Microsoft Excel automatically determines the name of the trendline.
    [Nullable[bool]]$IsNameAuto
    # Gets the legend entry according to this trendline
    [LegendEntry]$LegendEntry
    # Returns the name of the trendline.
    [string]$Name
    # Returns or sets the trendline order (an integer greater than 1) when the trendline type is Polynomial. The order must be between 2 and 6.
    [Nullable[int32]]$Order
    # Returns or sets the period for the moving-average trendline.
    [Nullable[int32]]$Period
    # Returns the trendline type.
    [string]$Type
}
