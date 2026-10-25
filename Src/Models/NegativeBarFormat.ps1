# NegativeBarFormat — Represents the color settings of the data bars for negative values that are defined by a data bar conditional formating rule.
class NegativeBarFormat {
    # Gets or sets a FormatColor object that you can use to specify the border color for negative data bars.
    [Color]$BorderColor
    # Gets whether to use the same border color as positive data bars.
    [string]$BorderColorType
    # Gets or sets a FormatColor object that you can use to specify the fill color for negative data bars.
    [Color]$Color
    # Gets or sets whether to use the same fill color as positive data bars.
    [string]$ColorType
}
