# DataLabels — Encapsulates a collection of all the DataLabel objects for the specified Series.
class DataLabels : ChartFrame {
    # Indicates the text is auto generated.
    [Nullable[bool]]$IsAutoText
    # A nullable boolean property "IsDeleted" indicating whether an object has been deleted.
    [Nullable[bool]]$IsDeleted
    [string]$LinkedSource
    # Gets and sets the built-in number format.
    [Nullable[int32]]$Number
    # Represents the format string for the DataLabels object.
    [string]$NumberFormat
    # True if the number format is linked to the cells (so that the number format changes in the labels when it changes in the cells).
    [Nullable[bool]]$NumberFormatLinked
    # Represents the position of the data label.
    [string]$Position
    [Nullable[int32]]$RotationAngle
    # Gets or sets the separator type used for the data labels on a chart.
    [string]$Separator
    # Represents a specified chart's data label percentage value display behavior. True displays the percentage value. False to hide.
    [Nullable[bool]]$ShowBubbleSize
    # Represents a specified chart's data label category name display behavior.True to display the category name for the data labels on a chart. False to hide.
    [Nullable[bool]]$ShowCategoryName
    # Represents a specified chart's data label legend key display behavior. True if the data label legend key is visible.
    [Nullable[bool]]$ShowLegendKey
    # Represents a specified chart's data label percentage value display behavior. True displays the percentage value. False to hide.
    [Nullable[bool]]$ShowPercentage
    # Returns or sets a Boolean to indicate the series name display behavior for the data labels on a chart. True to show the series name. False to hide.
    [Nullable[bool]]$ShowSeriesName
    # Represents a specified chart's data label values display behavior. True displays the values. False to hide.
    [Nullable[bool]]$ShowValue
    # Gets or sets the text of data label.
    [string]$Text
    [string]$TextDirection
    [string]$TextHorizontalAlignment
    [string]$TextVerticalAlignment
}
