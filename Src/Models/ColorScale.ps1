# ColorScale — Describe the ColorScale conditional formatting rule. This conditional formatting rule creates a gradated color scale on the cells.
class ColorScale {
    # Get or set this ColorScale's max value object. Cannot set null or CFValueObject with type FormatConditionValueType.Min to it.
    [ConditionalFormattingValue]$MaxCfvo
    # Get or set the gradient color for the maximum value in the range.
    [Color]$MaxColor
    # Get or set this ColorScale's mid value object. Cannot set CFValueObject with type FormatConditionValueType.Max or FormatConditionValueType.Min to it.
    [ConditionalFormattingValue]$MidCfvo
    # Get or set the gradient color for the middle value in the range.
    [Color]$MidColor
    # Get or set this ColorScale's min value object. Cannot set null or CFValueObject with type FormatConditionValueType.Max to it.
    [ConditionalFormattingValue]$MinCfvo
    # Get or set the gradient color for the minimum value in the range.
    [Color]$MinColor
}
