# DataBar — Describe the DataBar conditional formatting rule. This conditional formatting rule displays a gradated data bar in the range of cells.
class DataBar {
    # Gets the color of the axis for cells with conditional formatting as data bars.
    [Color]$AxisColor
    # Gets or sets the position of the axis of the data bars specified by a conditional formatting rule.
    [string]$AxisPosition
    # Gets an object that specifies the border of a data bar.
    [DataBarBorder]$BarBorder
    # Gets or sets how a data bar is filled with color.
    [string]$BarFillType
    # Get or set this DataBar's Color.
    [Color]$Color
    # Gets or sets the direction the databar is displayed.
    [string]$Direction
    # Get or set this DataBar's max value object. Cannot set null or CFValueObject with type FormatConditionValueType.Min to it.
    [ConditionalFormattingValue]$MaxCfvo
    # Represents the max length of data bar .
    [Nullable[int32]]$MaxLength
    # Get or set this DataBar's min value object. Cannot set null or CFValueObject with type FormatConditionValueType.Max to it.
    [ConditionalFormattingValue]$MinCfvo
    # Represents the min length of data bar .
    [Nullable[int32]]$MinLength
    # Gets the NegativeBarFormat object associated with a data bar conditional formatting rule.
    [NegativeBarFormat]$NegativeBarFormat
    # Get or set the flag indicating whether to show the values of the cells on which this data bar is applied. Default value is true.
    [Nullable[bool]]$ShowValue
}
